#' @title Accept Qualification Request
#' @description Accepts a request for qualification
#' @return Empty body and no errors, if successful.
#' @export
accept_qualification_request <- function(id, value, ...) {
  if(!is.character(id) | !is.integer(value)) {
    stop("`id` must be a character vector, and `value` must be an integer")
  }

  b <- list(
    QualificationRequestId = id,
    IntegerValue = value
  )

  res <- mturkHTTP(
    action = "AcceptQualificationRequest",
    body = b
  )
}
