output "qatalyst_alb_sg_id" {
  value = aws_security_group.qatalyst_alb_sg.id
}

output "qatalyst_alb_target_group_arn" {
  value = aws_lb_target_group.qatalyst_tg.arn
}

output "qatalyst_alb_arn" {
  value = aws_lb.qatalyst_alb.arn
}
