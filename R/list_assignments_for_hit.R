#'
#' @title List Assignments for HIT
#' @description Gets completed assignments for a HIT. You can use this operation to retrieve the results for a HIT
#' @return If successful, a list of Assignment objects associated with a HIT
#' @export
#'
#' @param id The id of the HIT
#' @param assignment_statuses The status of the assignments to return: Submitted | Approved | Rejected
#' @param next_token Pagination token
#' @param max_results Maximum number of Assignments to return
#'
list_assignments_for_hit <- function(
    id,
    assignment_statuses,
    next_token,
    max_results
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id)
  )

  b <- list(
    HITId = id,
    AssignmentStatuses = assignment_statuses,
    NextToken = next_token,
    MaxResults = max_results
  )

  res <- mturkHTTP(
    action = "ListAssignmentsForHIT",
    body = b
  )
}
