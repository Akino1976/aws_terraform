output "db_password_arn" {
  value       = aws_ssm_parameter.db_password.arn
  description = "Arn of db-password"
}

output "db_password_name" {
  value       = aws_ssm_parameter.db_password.name
  description = "Arn of db-password"
}
