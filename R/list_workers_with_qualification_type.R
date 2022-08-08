#'
#' @title List Workers with Qualification Type
#' @description Lists all of the Workers with a given Qualification type.
#' @return If successful, a list of Qualifications that have been granted to Workers.
#' @export
#'
#' @param id The ID of the Qualification Type
#' @param status The status of the Qualifications to return. Granted | Revoked
#' @param next_token Pagination token
#' @param max_results Maximum number of Workers to return
#'
list_workers_with_qualification_type <- function(
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
    QualificationTypeId = id,
    Status = status,
    NextToken = next_token,
    MaxResults = max_results
  )

  res <- mturkHTTP(
    action = "ListWorkersWithQualificationType",
    body = b
  )
}
