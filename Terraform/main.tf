provider "aws" {
  region = var.region
}

resource "aws_codecommit_repository" "example" {
  repository_name = var.repository_name
  description     = var.repository_description

  tags = {
    Name        = var.repository_name
    Environment = var.environment
  }
}
resource "null_resource" "push_to_codecommit" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      cd \Users\Harshithaa\Desktop\ 
      cd C:\Users\Harshithaa\Desktop\Terraform\job.yaml
      git init
      git config --global user.email "you@example.com"
      git config --global user.name "Your Name"
      git add user.yaml
      git commit -m "Add user.yaml"
      git remote add codecommit ${aws_codecommit_repository.example_repo.clone_url_http}
      git push --force codecommit master
    EOT
  }
}

provider "aws" {
  region = "us-east-1"  # Replace with your AWS region
}

resource "aws_codecommit_repository" "example_repo" {
  repository_name = "example-repo"
  description     = "Example CodeCommit repository"
  tags = {
    Environment = "Development"
    Project     = "MyProject"
  }
}

resource "null_resource" "push_to_codecommit" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      cd /path/to/local/directory  # Replace with the path to your local directory
      git init
      git config --global user.email "you@example.com"
      git config --global user.name "Your Name"
      git add user.yaml
      git commit -m "Add user.yaml"
      git remote add codecommit ${aws_codecommit_repository.example_repo.clone_url_http}
      git push --force codecommit master
    EOT
  }
}
