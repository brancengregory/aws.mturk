#'
#' @title Create HIT
#' @description Creates a HIT
#' @return If successful, a HIT object.
#' @export
#'
#' @param title The title of a HIT
#' @param description A general description of the HIT
#' @param question The data the person completing the HIT uses to produce the results
#' @param layout_id The id of a pre-existing HIT design with placeholder values
#' @param layout_parameters A structure for filling placeholder values in a HIT layout
#' @param reward U.S. Dollar amount the Requester will pay a Worker for completing the HIT successfully
#' @param assignment_duration The amount of time, in seconds, that a Worker has to complete the HIT after accepting it
#' @param lifetime An amount of time, in seconds, after which the HIT is no longer available for users to accept
#' @param keywords One or more words or phrases that describe the HIT
#' @param max_assignments The number of times the HIT can be accepted and completed before the HIT becomes unavailable
#' @param auto_approval_delay The number of seconds after an assignment for the HIT has been submitted, after which the assignment is considered Approved automatically unless the Requester explicitly rejects it
#' @param qualifications Conditions that a Worker's Qualifications must meet before the Worker is allowed to accept and complete the HIT
#' @param assignment_review_policy Policies that apply to the assignments under the HIT; you can specify for Mechanical Turk to take various actions based on the policy
#' @param hit_review_policy Policies that apply to the HIT; you can specify for Mechanical Turk to take various actions based on the policy
#' @param annotation An arbitrary data field that lets your application attach arbitrary data to the HIT for tracking purposes
#' @param ... Placeholder for future arguments
#' @param .token A unique identifier for this request that allows you to retry the call on error without creating duplicate HITs
#'
create_hit <- function(
    title,
    description,
    question,
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
