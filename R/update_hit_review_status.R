#'
#' @title Update HIT Review Status
#' @description Toggles the status of a HIT. If the status is Reviewable, this operation updates the status to Reviewing, or reverts a Reviewing HIT back to the Reviewable status.
#' @return If successful, a response with an empty body and no errors
#' @export
#'
#' @param id The HIT to update
#' @param revert Specifies whether to update the HIT Status from Reviewing to Reviewable
#'
update_hit_review_status <- function(
    id,
    revert
) {

  rlang::check_required(
    id
  )

  assertthat::assert_that(
    assertthat::is.string(id)
  )

  b <- list(
    HITId = id,
    Revert = revert
  )

  res <- mturkHTTP(
    action = "UpdateHITReviewStatus",
    body = b
  )
}
