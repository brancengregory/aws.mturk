#'
#' @title Create HIT With HIT Type
#' @description Creates a HIT of a particular HIT Type
#' @return If successful, a HIT object.
#' @export
#'
#' @param type The HIT type ID.
#' @param question The data the person completing the HIT uses to produce the results.
#' @param layout_id Allows you to use a pre-existing HIT design with placeholder values and create an additional HIT by providing those values as HITLayoutParameters
#' @param layout_parameters If the HITLayoutId is provided, any placeholder values must be filled in with values using the HITLayoutParameter structure.
#' @param lifetime An amount of time, in seconds, after which the HIT is no longer available for users to accept. After the lifetime of the HIT elapses, the HIT no longer appears in HIT searches, even if not all of the assignments for the HIT have been accepted.
#' @param max_assignments The number of times the HIT can be accepted and completed before the HIT becomes unavailable.
#' @param assignment_review_policy The Assignment-level Review Policy applies to the assignments under the HIT. You can specify for Mechanical Turk to take various actions based on the policy.
#' @param hit_review_policy The HIT-level Review Policy applies to the HIT. You can specify for Mechanical Turk to take various actions based on the policy.
#' @param annotation An arbitrary data field that lets your application attach arbitrary data to the HIT for tracking purposes
#' @param ... Placeholder for future arguments
#' @param .token A unique identifier for this request. Allows you to retry the call on error without creating duplicate HITs
#'
create_hit_with_hit_type <- function(
    type,
    question,
    layout_id,
    layout_parameters,
    lifetime,
    max_assignments,
    assignment_review_policy,
    hit_review_policy,
    annotation,
    ...,
    .token
) {

  rlang::check_required(
    type,
    lifetime,
    max_assignments
  )

  assertthat::assert_that(
    assertthat::is.string(type),
    assertthat::is.number(lifetime),
    assertthat::is.number(max_assignments)
  )

  b <- list(
    HITTypeId = type,
    Question = question,
    HITLayoutId = layout_id,
    HITLayoutParameters = layout_parameters,
    LifetimeInSeconds = lifetime,
    MaxAssignments = max_assignments,
    AssignmentReviewPolicy = assignment_review_policy,
    HITReviewPolicy = hit_review_policy,
    RequesterAnnotation = annotation,
    UniqueRequestToken = .token
  )

  res <- mturkHTTP(
    action = "CreateHITWithHITType",
    body = b
  )
}
