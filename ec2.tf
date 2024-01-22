resource "aws_instance" "main"{
    ami = data.aws_ssm_parameter.instance_ami.value
    instance_type = "t3.micro"
    key_name = "awinteransible"
    subnet_id = aws_subnet.public[0].id
    vpc_security_group_ids = [aws_vpc.main.default_security_group_id]
    tags = {
        "Name" = "${var.default_tags.env}-EC2"
    }
    user_data = base64encode(file("user.sh"))
}