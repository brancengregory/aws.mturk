#'
#' @title List Bonus Payments
#' @description Retrieves the amounts of bonuses you have paid to Workers for a given HIT or assignment.
#' @return If successful, a list of Bonuses with the following fields: WorkerId, BonusAmount, AssignmentId, Reason and GrantTime
#' @export
#'
#' @param id The id of the HIT
#' @param assignment The id of the assignment associated with the bonus payments to retrieve. If specified, only bonus payments for the given assignment are returned. Either the HITId parameter or the AssignmentId parameter must be specified
#' @param next_token Pagination token
#' @param max_results Maximum number of Assignments to return
#'
list_assignments_for_hit <- function(
    id,
    assignment,
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
    AssignmentId = assignment,
    NextToken = next_token,
    MaxResults = max_results
  )

  res <- mturkHTTP(
    action = "ListBonusPayments",
    body = b
  )
}
