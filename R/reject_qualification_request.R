#'
#' @title Reject Qualification Request
#' @description Rejects a user's request for a Qualification.
#' @return If successful, a response with an empty body and no errors
#' @export
#'
#' @param id The id of the assignment
#' @param reason A text message explaining why the request was rejected, to be shown to the Worker who made the request.
#'
reject_qualification_request <- function(
    id,
    reason
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id),
  )

  b <- list(
    QualificationRequestId = id,
    Reason = reason
  )

  res <- mturkHTTP(
    action = "RejectQualificationRequest",
    body = b
  )
}
