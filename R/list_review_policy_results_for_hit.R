#'
#' @title List Review Policy Results for HIT
#' @description Lists the computed results and the actions taken in the course of executing your Review Policies during a CreateHIT operation
#' @return If successful, a ListReviewPolicyResultsForHITResponse element containing the name of the Review Policy applied as well as the AssignmentReviewReport element and the HITReviewReport element.
#' @export
#'
#' @param id The unique identifier of the HIT to retrieve review results for
#' @param policy_level The Policy Level(s) to retrieve review results for - HIT or Assignment. If omitted, the default behavior is to retrieve all data for both policy levels
#' @param assignment If supplied, the results are limited to those pertaining directly to this Assignment ID.
#' @param retrieve_actions Retrieves a list of the actions taken executing the Review Policies and their outcomes. T or F.
#' @param retrieve_results Retrieves a list of the results computed by the Review Policies. T or F.
#' @param next_token Pagination token
#' @param max_results Maximum number of Policy Results to return
#'
list_review_policy_results_for_hit <- function(
    id,
    policy_level,
    assignment,
    retrieve_actions,
    retrieve_results,
    next_token,
    max_results
) {

  rlang::check_required(
    id,
    policy_level
  )

  assertthat::assert_that(
    assertthat::is.string(id),
    assertthat::is.string(policy_level)
  )

  b <- list(
    HITId = id,
    PolicyLevel = policy_level,
    AssignmentId = assignment,
    RetrieveActions = retrieve_actions,
    RetrieveResults = retrieve_results,
    NextToken = next_token,
    MaxResults = max_results
  )

  res <- mturkHTTP(
    action = "ListReviewPolicyResultsForHIT",
    body = b
  )
}
