
resource "aws_instance" "serverEc2" {
  ami           =  var.ami
  instance_type = var.instance_type
  key_name = "logkey"
  user_data     = file("${path.module}/postgresql.sh")
  subnet_id      = aws_subnet.pub-sub-vpc.id
  vpc_security_group_ids = [aws_security_group.vpc-sg.id]


  tags = {
    Name =  "postgresql-server"
    Env  = var.Env
  }


}