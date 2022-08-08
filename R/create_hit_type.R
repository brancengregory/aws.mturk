#'
#' @title Create HIT Type
#' @description Creates a HIT type
#' @return If successful, a HIT type id.
#' @export
#'
#' @param title The title of the HIT. A title should be short and descriptive about the kind of task the HIT contains. On the Amazon Mechanical Turk web site, the HIT title appears in search results, and everywhere the HIT is mentioned.
#' @param description A general description of the HIT. A description includes detailed information about the kind of task the HIT contains. On the Amazon Mechanical Turk web site, the HIT description appears in the expanded view of search results, and in the HIT and assignment screens. A good description gives the user enough information to evaluate the HIT before accepting it.
#' @param reward The US Dollar amount the Requester will pay a Worker for successfully completing the HIT.
#' @param assignment_duration The amount of time, in seconds, that a Worker has to complete the HIT after accepting it. If a Worker does not complete the assignment within the specified duration, the assignment is considered abandoned. If the HIT is still active (that is, its lifetime has not elapsed), the assignment becomes available for other users to find and accept.
#' @param keywords One or more words or phrases that describe the HIT, separated by commas. These words are used in searches to find HITs.
#' @param auto_approval_delay The number of seconds after an assignment for the HIT has been submitted, after which the assignment is considered Approved automatically unless the Requester explicitly rejects it.
#' @param qualifications A condition that a Worker's Qualifications must meet before the Worker is allowed to accept and complete the HIT.
#'
create_hit_type <- function(
    title,
    description,
    reward,
    assignment_duration,
    keywords,
    auto_approval_delay,
    qualifications
  ) {

  rlang::check_required(
    title,
    description,
    reward,
    assignment_duration,
    keywords
  )

  assertthat::assert_that(
    assertthat::is.string(title),
    assertthat::is.string(description),
    assertthat::is.string(reward),
    assertthat::is.number(assignment_duration),
    assertthat::is.string(keywords)
  )

  b <- list(
    Title = title,
    Description = description,
    Reward = reward,
    AssignmentDurationInSeconds = assignment_duration,
    QualificationRequirements = qualifications
  )

  res <- mturkHTTP(
    action = "CreateHITType",
    body = b
  )
}
