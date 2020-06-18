pipeline {
	agent any 
	environment {
  PATH = "${PATH}:${getTerraformPath()}"
	}
	stages{
		stage('terraform workspace and init'){
			steps{
				// sh "terraform workspace new dev"
				sh "terraform init"
			}
		}
	}
}

def getTerraformPath(){
	def tfHome = tool name: 'terraform-12', type: 'terraform'
	return tfHome
}
