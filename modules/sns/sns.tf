variable "name" {
    type        = string
    description = "topic name of sns"
}

resource "aws_sns_topic" "this" {
  name = var.name
}

resource "aws_sns_topic_policy" "default" {
  arn = aws_sns_topic.this.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}


data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "default_sns_policy_${var.name}"

  statement {
    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive",
    ]
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
        aws_sns_topic.this.arn
    ]

    sid = "__default_statement_ID"
  }
}
