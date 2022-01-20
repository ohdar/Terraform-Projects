# Create an SNS Topic
# terraform aws create sns topic
resource "aws_sns_topic" "user-updates" {
  name = "updates-topic"
}

# Creaate and SNS Topic Subscription
# terraform aaws sns topicc subscription
resource "aws_sns_topic_subscription" "notification-topic" {
  topic_arn = aws_sns_topic.user-updates.arn
  protocol = "email"
  endpoint = "${var.endpoint-email}"
}