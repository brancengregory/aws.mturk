#' @title Create Additional Assignments for HIT
#' @description Creates additional assignments for a HIT
#' @return If successful, Empty body and no errors.
#' @export
create_additional_assignments_for_hit <- function(id, amount) {
  if(!is.character(id) | !is.integer(amount)) {
    stop("`id` must be a character vector, and `amount` must be an integer")
  }

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
