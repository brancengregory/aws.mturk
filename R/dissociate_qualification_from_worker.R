#'
#' @title Dissociate Qualification from Worker
#' @description Dissociates a Qualification from a Worker
#' @return If successful, empty body and no errors
#' @export
#'
#' @param id The id of the Qualification type of the Qualification to be revoked.
#' @param worker The id of the Worker who possesses the Qualification to be revoked.
#' @param reason A text message that explains why the Qualification was revoked. The user who had the Qualification sees this message. IF a reason is not provided, the worker will not be notified.
#'
dissociate_qualification_from_worker <- function(
    id,
    worker,
    reason
) {

  rlang::check_required(
    id,
    worker
  )

  assertthat::assert_that(
    assertthat::is.string(id),
    assertthat::is.string(worker)
  )

  b <- list(
    QualificationTypeId = id,
    WorkerId = worker,
    Reason = reason
  )

  res <- mturkHTTP(
    action = "DissociateQualificationFromWorker",
    body = b
  )
}
