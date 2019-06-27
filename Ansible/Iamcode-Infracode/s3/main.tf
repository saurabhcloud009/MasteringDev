#Configure the AWS Provider                     
provider "aws" {                                
    access_key = "${var.access_key}"            
    secret_key = "${var.secret_key}"            
    region = "us-east-2"                        
}                                               
 
resource "aws_s3_bucket" "b" {
  bucket = "mytftestbucket4321"
  acl    = "private"

  tags {
    Name        = "mybucket12344321"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "ba" {               
  bucket = "mytftestbucket43214"              
  acl    = "private"                         
                                             
  tags {                                     
    Name        = "mybucket12344321"         
    Environment = "Dev"                      
  }                                          
}                                             
