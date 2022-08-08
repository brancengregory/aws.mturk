#'
#' @title Notify Workers
#' @description Sends an email to one or more Workers that you specify with the Worker ID. You can specify up to 100 Worker IDs to send the same message with a single call to the NotifyWorkers operation. The NotifyWorkers operation will send a notification email to a Worker only if you have previously approved or rejected work from the Worker.
#' @return If successful, a response with an empty body and no errors
#' @export
#'
#' @param subject The subject line of the email message to send. Can include up to 200 characters.
#' @param message_text The text of the email message to send. Can include up to 4,096 characters.
#' @param workers A vector of WorkerIds to notify. You can notify upto 100 Workers at a time.
#'
notify_workers <- function(
    subject,
    message_text,
    workers
) {

  rlang::check_required(
    subject,
    message_text,
    workers
  )

  assertthat::assert_that(
    assertthat::is.string(subject),
    assertthat::is.string(message_text),
    is.character(workers)
  )

  b <- list(
    Subject = subject,
    MessageText = message_text,
    WorkerIds = workers
  )

  res <- mturkHTTP(
    action = "NotifyWorkers",
    body = b
  )
}
