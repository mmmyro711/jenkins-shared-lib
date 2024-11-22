def call () {
        emailext (subject: "FAILED: Job ${env.JOB_NAME}", 
            body: "Job ${env.JOB_NAME}  with ${env.BUILD_NUMBER} has finished with failure.  This is the job: ${env.JOB_URL}", 
            to: "myaremenko7@gmail.com")
}