#' @title Create HIT Type
#' @description Creates a HIT type
#' @return If successful, a HIT type id.
#' @export
create_hit_type <- function(
    title,
    description,
    reward,
    assignment_duration,
    keywords,
    auto_approval_delay,
    qualifications
  ) {
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
