#' @title Create HIT With HIT Type
#' @description Creates a HIT of a particular HIT Type
#' @return If successful, a HIT object.
#' @export
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
