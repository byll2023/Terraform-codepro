// Integrer des donnees externes dans votre configuration terraform.
data "aws_instance" "existing_instance" {
  instance_id = "i-0fd569c3a8ed45071"
}
