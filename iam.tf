resource "aws_iam_role_policy" "iam_lamda_policy" {
  name = "iam_lamda_policy"
  role = aws_iam_role.lamda_role.id
  policy = "${file("policy.json")}"
}

resource "aws_iam_role" "lamda_role" {
  name = "lamda_role"
  assume_role_policy = "${file("role.json")}"
}
