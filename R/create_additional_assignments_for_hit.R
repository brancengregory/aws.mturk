#' @title Create Additional Assignments for HIT
#' @description Creates additional assignments for a HIT
#' @return If successful, Empty body and no errors.
#' @export
create_additional_assignments_for_hit <- function(id, amount, ..., .token = rlang::missing_arg()) {
  rlang::check_required(id, amount, .token)
  assertthat::assert_that(
    assertthat::is.string(id),
    assertthat::is.number(amount),
    assertthat::is.string(.token)
  )

  unique_request_token <- NULL

  b <- list(
    HITId = id,
    NumberOfAdditionalAssignments = amount,
    UniqueRequestToken = unique_request_token
  )

  res <- mturkHTTP(
    action = "CreateAdditionalAssignmentsForHIT",
    body = b
  )
}
