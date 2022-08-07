#' @title Create HIT Type
#' @description Creates a HIT type
#' @return If successful, a HIT type id.
#' @export
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
