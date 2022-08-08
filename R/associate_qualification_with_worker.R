#'
#' @title Associate Qualification with Worker
#' @description Associates a qualification with a worker
#' @return If successful, empty body and no errors.
#' @export
#'
#' @param type The id of the Qualification type to use for the assigned Qualification.
#' @param id The id of the Worker to whom the Qualification is being assigned.
#' @param value The value of the Qualification to assign
#' @param ... Placeholder for future arguments
#' @param .notify Specifies whether to send a notification email message to the Worker saying that the qualification was assigned to the Worker.
#'
associate_qualification_with_worker <- function(type, id, value, ..., .notify = F) {

  rlang::check_required(
    type,
    id,
    value
  )

  assertthat::assert_that(
    assertthat::is.string(type),
    assertthat::is.string(id),
    assertthat::is.number(value)
  )

  b <- list(
    QualificationTypeId = type,
    WorkerId = id,
    IntegerValue = value,
    SendNotification = .notify
  )

  res <- mturkHTTP(
    action = "AssociateQualificationWithWorker",
    body = b
  )
}
