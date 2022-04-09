def first_num = "0"
def second_num = "0"
pipeline {
    agent any
    stages {
        stage('Checkout SCM') {
            steps {
                git 'https://github.com/PradeepSinghMakwana/pradeep-simple-bash-examples.git'
            }
        }
        stage('Input') {
            agent none
            steps {
                script {
                    first_num = input (
                        message: 'Enter First Number: ',
                        ok: 'Submit',
                        parameters: [string(defaultValue: '0', description: 'First Number', name: 'first_num', trim: true)]
                    )
                    second_num = input (
                        message: 'Enter Second Number: ',
                        ok: 'Submit',
                        parameters: [string(defaultValue: '0', description: 'Second Number', name: 'second_num', trim: true)] 
                        
                    )
                }
            }
        }
        stage('Calculate') {
            
            steps {
                sh script: WORKSPACE+"/bash-examples/calculator.sh subtract $first_num $second_num"
                
            }
        }
        
    }
}
