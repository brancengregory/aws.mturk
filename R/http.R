#' @title Execute AWS MTurk API Request
#' @description This is the workhorse function to execute calls to the MTurk API.
#' @param action A character string specifying an API endpoint.
#' @param query An optional named list containing query string parameters and their character values.
#' @param headers A list of headers to pass to the HTTP request.
#' @param body A request body
#' @param version A character string specifying the API version.
#' @param verbose A logical indicating whether to be verbose. Default is given by \code{options("verbose")}.
#' @param region A character string specifying an AWS region. See \code{\link[aws.signature]{locate_credentials}}.
#' @param key A character string specifying an AWS Access Key. See \code{\link[aws.signature]{locate_credentials}}.
#' @param secret A character string specifying an AWS Secret Key. See \code{\link[aws.signature]{locate_credentials}}.
#' @param session_token Optionally, a character string specifying an AWS temporary Session Token to use in signing a request. See \code{\link[aws.signature]{locate_credentials}}.
#' @param ... Additional arguments passed to \code{\link[httr]{GET}}.
#' @return If successful, a named list. Otherwise, a data structure of class \dQuote{aws-error} containing any error message(s) from AWS and information about the request attempt.
#' @details This function constructs and signs an MTurk API request and returns the results thereof, or relevant debugging information in the case of error.
#' @author Brancen Gregory
#' @import httr
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom aws.signature signature_v4_auth locate_credentials
#' @export
mturkHTTP <- function(
    action,
    headers = list(),
    query = list(),
    body = NULL,
    version = "v1",
    verbose = getOption("verbose", FALSE),
    region = Sys.getenv("AWS_DEFAULT_REGION", "us-east-1"),
    key = NULL,
    secret = NULL,
    session_token = NULL,
    ...
  ) {
    # locate and validate credentials
    credentials <- locate_credentials(key = key, secret = secret, session_token = session_token, region = region, verbose = verbose)
    key <- credentials[["key"]]
    secret <- credentials[["secret"]]
    session_token <- credentials[["session_token"]]
    region <- credentials[["region"]]

    # generate request signature
    d_timestamp <- format(Sys.time(), "%Y%m%dT%H%M%SZ", tz = "UTC")
    url <- paste0("https://mturk-requester.",region,".amazonaws.com")
    Sig <- signature_v4_auth(
      datetime = d_timestamp,
      region = region,
      service = "mturk",
      verb = "POST",
      action = "/",
      query_args = query,
      canonical_headers = list(host = paste0("mturk-requester.",region,".amazonaws.com"),
                               "x-amz-date" = d_timestamp,
                               "X-Amz-Target" = paste0("MTurk.", action),
                               "Content-Type" = "application/x-amz-json-1.1"),
      request_body = if (is.null(body)) "" else jsonlite::toJSON(body, auto_unbox = TRUE),
      key = key,
      secret = secret,
      session_token = session_token,
      verbose = verbose)
    # setup request headers
    headers[["X-Amz-Target"]] <- paste0("MTurk.", action)
    headers[["Content-Type"]] <- "application/x-amz-json-1.1"
    headers[["x-amz-date"]] <- d_timestamp
    headers[["x-amz-content-sha256"]] <- Sig$BodyHash
    headers[["Authorization"]] <- Sig[["SignatureHeader"]]
    if (!is.null(session_token) && session_token != "") {
      headers[["x-amz-security-token"]] <- session_token
    }
    H <- do.call(add_headers, headers)

    # execute request
    if (length(query)) {
      r <- GET(url, H, query = query, body = body, encode = "json", ...)
    } else {
      r <- GET(url, H, body = body, encode = "json", ...)
    }

    if (http_error(r)) {
      x <- jsonlite::fromJSON(content(r, "text", encoding = "UTF-8"))
      warn_for_status(r)
      h <- headers(r)
      out <- structure(x, headers = h, class = "aws_error")
      attr(out, "request_canonical") <- Sig$CanonicalRequest
      attr(out, "request_string_to_sign") <- Sig$StringToSign
      attr(out, "request_signature") <- Sig$SignatureHeader
    } else {
      out <- try(jsonlite::fromJSON(content(r, "text", encoding = "UTF-8")), silent = TRUE)
      if (inherits(out, "try-error")) {
        out <- structure(content(r, "text", encoding = "UTF-8"), "unknown")
      }
    }
    return(out)
  }
