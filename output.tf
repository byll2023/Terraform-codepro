// recuperer l'adresse IP publique de l'instance.
output "public-ip" {
  value = aws_instance.serverEc2.public_ip
}
// recuperer l'ID de l'instance et le rendre disponible dans le file state de terraform
output "instance-id" {
  value = aws_instance.serverEc2.id
}
// recuperer l'adresse IP privee de l'instance.
output "private-id" {
  value = aws_instance.serverEc2.private_ip
}
// recuperer le type d'instance.
output "instance-type" {
  value = aws_instance.serverEc2.instance_type
}