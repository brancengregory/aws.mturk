#'
#' @title Send Test Event Notification
#' @description Causes Amazon Mechanical Turk to send a notification message as if a HIT event occurred, according to the provided notification specification
#' @return If successful, a response with an empty body and no errors
#' @export
#'
#' @param notification The notification specification to test. This value is identical to the value you would provide to the UpdateNotificationSettings operation when you establish the notification specification for a HIT type.
#' @param test_event_type The event to simulate to test the notification specification. This event is included in the test message even if the notification specification does not include the event type. The notification specification does not filter out the test event.
#'
send_test_event_notification <- function(
    notification,
    test_event_type
) {

  rlang::check_required(
    notification,
    test_event_type
  )

  assertthat::assert_that(

  )

  b <- list(
    Notification = notification,
    TestEventType = test_event_type
  )

  res <- mturkHTTP(
    action = "SendTestEventNotification",
    body = b
  )
}
