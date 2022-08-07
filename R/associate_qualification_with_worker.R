#' @title Associate Qualification with Worker
#' @description Associates a qualification with a worker
#' @return If successful, Empty body and no errors.
#' @export
associate_qualification_with_worker <- function(type, id, value, ..., .notify = F) {
  if(!is.character(id) | !is.character(id) | !is.integer(value) | !is.logical(.notify)) {
    stop("`type` and `id` must be a character vectors, `value` must be an integer, and `.notify` must be a logical")
  }

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
