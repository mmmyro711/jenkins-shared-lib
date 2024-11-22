def notificationsSend(String currentBuild) {
    if (${currentBuild} == SUCCESS){
                emailext (
                    subject: "SUCCESSFUL:Job ${env.JOB_NAME}",
                    body: """
                        <html>
                            <body>
                                <p>Job ${env.JOB_NAME} with ${env.BUILD_NUMBER} has finished successfully </p>. 
                                <p>This is the job URL: ${env.JOB_URL}</p>
                            </body>
                        <html>
                    """,
                    to: "myaremenko7@gmail.com",
                    mimeType: 'text/html'
                    ) 
    }
    else if (currentBuild == FAILURE){
            emailext (
                subject: "FAILED:Job ${env.JOB_NAME}",
                body: "Job ${env.JOB_NAME} with ${env.BUILD_NUMBER} has finished with failure. This is the job URL: ${env.JOB_URL}",
                to: "myaremenko7@gmail.com")
    }
    else if (currentBuild == UNSTABLE){
            emailext (
                subject: "UNSTABLE:Job ${env.JOB_NAME}",
                body: "Job ${env.JOB_NAME} with ${env.BUILD_NUMBER} has finished with unstable. This is the job URL: ${env.JOB_URL}",
                to: "myaremenko7@gmail.com")
    }
    else {
            emailext (
                subject: "UNKNOW:Job ${env.JOB_NAME}",
                body: "Job ${env.JOB_NAME} with ${env.BUILD_NUMBER} has finished with unknow. This is the job URL: ${env.JOB_URL}",
                to: "myaremenko7@gmail.com")
    }
}
