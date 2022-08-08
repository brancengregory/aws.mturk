#'
#' @title List Reviewable HITs
#' @description Retrieves the HITs with Status equal to Reviewable or Status equal to Reviewing that belong to the Requester calling the operation
#' @return If successful, a list of HIT objects
#' @export
#'
#' @param id The id of the HIT type of the HITs to consider for the query
#' @param status The status of the HITs to return: Reviewable | Reviewing
#' @param next_token Pagination token
#' @param max_results Maximum number of HITs to return
#'
list_review_policy_results_for_hit <- function(
    id,
    status,
    next_token,
    max_results
) {

  rlang::check_required(
  )

  assertthat::assert_that(

  )

  b <- list(
    HITTypeId = id,
    Status = status,
    NextToken = next_token,
    MaxResults = max_results
  )

  res <- mturkHTTP(
    action = "ListReviewableHITs",
    body = b
  )
}
