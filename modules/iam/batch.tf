#IAM Roles for Batch
resource "aws_iam_role" "qatalyst_batch_service_role" {
  provider = aws.iam_region
  name     = "qatalyst-batch-service-role"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "batch.amazonaws.com"
          },
          "Effect" : "Allow",
          "Sid" : ""
        }
      ]
  })
}

resource "aws_iam_role_policy_attachment" "qatalyst_batch_service_role_attachment" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_batch_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}
