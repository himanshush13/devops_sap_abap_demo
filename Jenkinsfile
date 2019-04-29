pipeline {
          agent any
          options {
                    timeout(time: 1, unit: 'HOURS')          
                  }
          parameters {
                      string(name: 'Id', defaultValue: '0034', description: 'Enter the ID')
                      string(name: 'Rfcdest', defaultValue: 'ARDRFC100', description: 'Enter the RFC Destination')
                      booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value (boolean sample option)')
                      choice(name: 'CHOICE', choices: ['SAP ECC', 'S/4HANA'], description: 'Choice sample option')
                      //password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password (sample option)')
                      //file(name: "FILE", description: "Choose a file to upload (sample option)")
                     }
          stages {
                  stage('SAP ECC') {
                  when {
                        expression { params.CHOICE == 'SAP ECC' }
                       }  
                  steps {
                      sh 'whoami'
                      sh 'ls -lrta'
                      echo 'This is a GET API test'
                      echo "Id is ${params.Id}"
                      echo "RFC Dest. is ${params.Rfcdest}"
                    
                  } // end steps clause
                 } //end SAP ECC stage clause
                  stage('UNIT TEST') {
                  steps {
                      build job: 'sap-cli-test', parameters: [string(name: 'SAP_ASHOST', value: '35.174.22.86'), string(name: 'SAP_USER', value: 'DEVELOPER'),  string(name: 'SAP_CLIENT', value: '001'), string(name: 'SAP_SSL', value: 'NO'), string(name: 'SAP_PORT', value: '8000'), string(name: 'OBJECT_NAME', value: 'ZTESTING_ABAPGIT'), string(name: 'OBJECT_TYPE', value: 'program')] 
                  }
                   
                } // end stage clause
  
              
          } // end stages clause
          post { 
               always { 
                      echo 'I will always say Hello again!'
                      sh 'ls -lrta'
                      cleanWs()
                      }
               }    
    }
