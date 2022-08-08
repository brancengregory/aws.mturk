#'
#' @title Dissociate Qualification from Worker
#' @description Dissociates a Qualification from a Worker
#' @return If successful, empty body and no errors
#' @export
#'
#' @param id
#' @param worker
#' @param integer_value
#' @param reason
#'
dissociate_qualification_from_worker <- function(
    id,
    worker,
    integer_value,
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
    IntegerValue = integer_value,
    Reason = reason
  )

  res <- mturkHTTP(
    action = "DissociateQualificationFromWorker",
    body = b
  )
}
