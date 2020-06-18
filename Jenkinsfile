pipeline {
	agent any 
	environment {
  PATH = "${PATH}:${getTerraformPath()}"
	}
	stages{
		stage('Terraform Init'){
			steps{
				// sh "terraform workspace new dev"
				sh "terraform init"
			}
		}
		stage('Terraform dev worskpace'){
			steps{
				sh "terraform workspace select dev"
			}
		}
		stage('Terraform Planning'){
			steps{
				sh "terraform plan -var-file=dev.tfvars -auto-approve"
			}
		}
	}
}

def getTerraformPath(){
	def tfHome = tool name: 'terraform-12', type: 'terraform'
	return tfHome
}
