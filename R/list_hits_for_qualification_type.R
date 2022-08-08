#'
#' @title List HITs for Qualification Type
#' @description Lists HITs that use the given Qualification Type
#' @return If successful, a list of HIT objects
#' @export
#'
#' @param id The id of the Qualification type to use when querying HITs.
#' @param next_token Pagination token
#' @param max_results Maximum number of Assignments to return
#'
list_hits_for_qualification_type <- function(
    id,
    next_token,
    max_results
) {

  rlang::check_required(

  )

  assertthat::assert_that(
  )

  b <- list(
    QualificationTypeId = id,
    NextToken = next_token,
    MaxResults = max_results
  )

  res <- mturkHTTP(
    action = "ListHITsForQualificationType",
    body = b
  )
}
