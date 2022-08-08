#'
#' @title Accept Qualification Request
#' @description Accepts a request for qualification
#' @return Empty body and no errors, if successful.
#' @export
#'
#' @param id The ID of the Qualification request, as returned by the ListQualificationRequests operation.
#' @param value The value of the Qualification. You can omit this value if you are using the presence or absence of the Qualification as the basis for a HIT requirement.
#' @param ... Placeholder for future arguments
#'
accept_qualification_request <- function(
    id,
    value,
    ...
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id)
  )

  b <- list(
    QualificationRequestId = id,
    IntegerValue = value
  )

  res <- mturkHTTP(
    action = "AcceptQualificationRequest",
    body = b
  )
}
