resource "aws_autoscaling_policy" "aws_project_web_policy_up" {
  name = "aws_project_web_policy"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.aws_project_asg.name}"
}

resource "aws_autoscaling_policy" "aws_project_web_policy_down" {
  name = "aws_project_web_policy_down"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.aws_project_asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "aws_project_web_cpu_alarm_up" {
  alarm_name = "aws_project_web_cpu_alarm_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "70"
dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.aws_project_asg.name}"
  }
alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = [ "${aws_autoscaling_policy.aws_project_web_policy_up.arn}" ]
}

resource "aws_cloudwatch_metric_alarm" "aws_project_web_cpu_alarm_down" {
  alarm_name = "aws_project_web_cpu_alarm_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "30"
dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.aws_project_asg.name}"
  }
alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = [ "${aws_autoscaling_policy.aws_project_web_policy_down.arn}" ]
}