resource "aws_sns_topic" "topic" {
  name = "sns-to-email"
}
resource "aws_sns_topic_subscription" "this" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = "naren18571@gmail.com"
}