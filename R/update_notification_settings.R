#'
#' @title Update Notification Settings
#' @description Creates, updates, disables or re-enables notifications for a HIT type.
#' @return If successful, a response with an empty body and no errors
#' @export
#'
#' @param id The HIT to update
#' @param notification The notification specification for the HIT Type
#' @param active Specifies whether notifications are sent for HITs of this HIT type, according to the notification specification. You must specify either the Notification parameter or the Active parameter
#'
update_notification_settings <- function(
    id,
    notification,
    active
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id)
  )

  b <- list(
    HITTypeId = id,
    Notification = notification,
    Active = active
  )

  res <- mturkHTTP(
    action = "UpdateNotificationSettings",
    body = b
  )
}
