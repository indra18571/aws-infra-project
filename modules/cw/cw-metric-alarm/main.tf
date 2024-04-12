# creates alarm that monitors the instance with id provided
resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name                = "${var.instance-id}-ec2-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 60
  statistic                 = "Average"
  threshold                 = 70
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
   dimensions = {
    InstanceId = var.instance-id
  }
alarm_actions       = [var.sns-topic-arn]
}