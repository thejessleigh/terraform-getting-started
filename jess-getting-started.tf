// this provisioner assumes that there is a *.auto.tfvars file that populates the following variables
// aws_credentials
// ami_id


// provider block used to configure the named provider, which is responsible for creating and managing resources
provider "aws" {
  access_key = "${var.aws_credentials["access_key"]}"
  secret_key = "${var.aws_credentials["secret_key"]}"
  region = "us-east-1"
  profile = "staging"
}


// defines a resource that exists within the infrastructure, ex: EC2 instance or Heroku application
// 2 strings bfore opening the block - resource type and resource name
// prefix of resource type maps to the provider
// configuration for providers is documented at https://www.terraform.io/docs/providers/index.html
resource "aws_instance" "jess-getting-started" {
  ami = "${var.ami_id}"
  instance_type = "t3.micro"
  tags {
    Name = "jess-getting-started"
  }
}


// adding an additional resource to the instance - elastic ip just for testing purposes here
//resource "aws_eip" "ip" {
//  instance = "${aws_instance.jess-getting-started.id}"
//}