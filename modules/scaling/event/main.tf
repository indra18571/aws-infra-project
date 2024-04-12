resource "aws_autoscaling_policy" "scale_down" {
  name                   = "test_scale_down"
  autoscaling_group_name = aws_autoscaling_group.autoscale.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 120
}

resource "aws_cloudwatch_metric_alarm" "scale_down" {
  alarm_description   = "Monitors CPU utilization"
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]
  alarm_name          = "test_scale_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  threshold           = "25"
  evaluation_periods  = "5"
  period              = "30"
  statistic           = "Average"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.autoscale.name
  }
}

resource "aws_autoscaling_schedule" "schedule" {
  scheduled_action_name  = "schedule"
  min_size               = 3
  max_size               = 6
  desired_capacity       = 3
  start_time             = "2023-06-06T18:00:00Z"
  end_time               = "2023-06-07T06:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.autoscale.name
}
