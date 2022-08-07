#'
#' @title Create HIT
#' @description Creates a HIT
#' @return If successful, a HIT object.
#' @export
#'
#' @param title The title of a HIT
#' @param description A general description of the HIT
#' @param question The data the person completing the HIT uses to produce the results
#' @param layout_id
#' @param layout_parameters
#' @param reward
#' @param assignment_duration
#' @param lifetime
#' @param keywords
#' @param max_assignments
#' @param auto_approval_delay
#' @param qualifications
#' @param assignment_review_policy
#' @param hit_review_policy
#' @param annotation
#' @param ...
#' @param .token
#'
create_hit <- function(
    title,
    description,
    questions,
    layout_id,
    layout_parameters,
    reward,
    assignment_duration,
    lifetime,
    keywords,
    max_assignments,
    auto_approval_delay,
    qualifications,
    assignment_review_policy,
    hit_review_policy,
    annotation,
    ...,
    .token
) {

  rlang::check_required(
    title,
    description,
    reward,
    assignment_duration,
    lifetime,
    keywords,
    max_assignments
  )

  assertthat::assert_that(
    assertthat::is.string(title),
    assertthat::is.string(description),
    assertthat::is.string(reward),
    assertthat::is.number(assignment_duration),
    assertthat::is.number(lifetime),
    assertthat::is.string(keywords),
    assertthat::is.number(max_assignments)
  )

  b <- list(
    Title = title,
    Description = description,
    Question = question,
    HITLayoutId = layout_id,
    HITLayoutParameters = layout_parameters,
    Reward = reward,
    AssignmentDurationInSeconds = assignment_duration,
    LifetimeInSeconds = lifetime,
    Keywords = keywords,
    MaxAssignments = max_assignments,
    AutoApprovalDelayInSeconds = auto_approval_delay,
    QualificationRequirements = qualifications,
    AssignmentReviewPolicy = assignment_review_policy,
    HITReviewPolicy = hit_review_policy,
    RequesterAnnotation = annotation,
    UniqueRequestToken = .token
  )

  res <- mturkHTTP(
    action = "CreateHIT",
    body = b
  )
}
