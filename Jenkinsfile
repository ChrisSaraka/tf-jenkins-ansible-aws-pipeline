pipeline {
	agent any 
	// environment {
  // PATH = "${PATH}:${getTerraformPath()}"
	// }
	stages{
	  stage(‘Set Terraform path’) {
 			steps {
 				script {
 					def tfHome = tool name: ‘Terraform’, type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
 					env.PATH = “${tfHome}:${env.PATH}”
 				}
 					sh ‘terraform — version’
	  }
		stage('terraform init'){
			steps{
				// sh "terraform workspace new dev"
				sh "terraform init"
			}
		}
	}
}

// def getTerraformPath(){
	// def tfHome = tool name: 'terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
	// return tfHome
// }
