locals {
lamda_zip_loc="outputs/welcome.zip"
}

data "archive_file" "Welcome" {
  type        = "zip"
  source_file = "Welcome.py"
  output_path = "${"local.lamda_zip_loc"}"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "${"local.lamda_zip_loc"}"
  function_name = "Welcome"
  role          = "${aws_iam_role.lamda_role.arn}"
  handler       = "Welcome.hello"

  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.7"

}
