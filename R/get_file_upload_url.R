#'
#' @title Get File Upload URL
#' @description Gets the URL for a File Upload
#' @return If successful, a string containing the temporary URL
#' @export
#'
#' @param id The id of the assignment that contains the question with a file upload answer
#' @param question_id The id of the question with a file upload answer, as specified in the question form of the HIT
#'
get_file_upload_url <- function(
    id,
    question_id
) {

  rlang::check_required(
    id,
    question_id
  )

  assertthat::assert_that(
    assertthat::is.string(id),
    assertthat::is.string(question_id)
  )

  b <- list(
    AssignmentId = id,
    QuestionIdentifier = question_id
  )

  res <- mturkHTTP(
    action = "GetFileUploadURL",
    body = b
  )
}
