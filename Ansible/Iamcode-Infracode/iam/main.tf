#Configure the AWS Provider                        
provider "aws" {                                   
    access_key = "${var.access_key}"               
    secret_key = "${var.secret_key}"               
    region = "us-east-2"                           
}                                                  
                                                   

resource "aws_iam_user" "sp" {
  name = "${var.name}"
  path = "/system/"

}


                                      
resource "aws_iam_access_key" "sp" {  
  user    = "${aws_iam_user.sp.name}" 
}                                     

resource "aws_iam_user_policy" "sp_ro" {
  name = "test"
  user = "${aws_iam_user.sp.name}"
  
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}		


resource "aws_iam_user_login_profile" "sp" {
  user    = "${aws_iam_user.sp.name}"
  pgp_key = "keybase:${var.name}"
}

output "password" {
  value = "${aws_iam_user_login_profile.sp.encrypted_password}"
}


output "User" {
  value = "${aws_iam_access_key.sp.user}"
}                                      

output "Smtp Password" {
  value = "${aws_iam_access_key.sp.ses_smtp_password}"
}

output "Access Key ID" {
  value = "${aws_iam_access_key.sp.id}"
}

output "Secret Access Key" {                                       
  value = "${aws_iam_access_key.sp.secret}"    
} 

output "Status" {               
  value = "${aws_iam_access_key.sp.status}"
}                                                                                                  
                                               
                                                      
                                                       
