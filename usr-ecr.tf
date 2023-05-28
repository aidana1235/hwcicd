provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "test" {
  name = "img-pipeline"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_iam_user" "githubactions" {
  name = "mygithubactions"
}

resource "aws_iam_user_policy_attachment" "attach_ecr_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  user = aws_iam_user.githubactions.name
}
