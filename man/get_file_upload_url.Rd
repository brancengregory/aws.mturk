% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_file_upload_url.R
\name{get_file_upload_url}
\alias{get_file_upload_url}
\title{Get File Upload URL}
\usage{
get_file_upload_url(id, question_id)
}
\arguments{
\item{id}{The id of the assignment that contains the question with a file upload answer}

\item{question_id}{The id of the question with a file upload answer, as specified in the question form of the HIT}
}
\value{
If successful, a string containing the temporary URL
}
\description{
Gets the URL for a File Upload
}
