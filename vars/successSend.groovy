def call ( ) {
    emailext (subject: "SUCCESSFUL: Job ${env.JOB_NAME}", 
        body: """<html>
                    <body>
                            <p> Job ${env.JOB_NAME}  with ${env.BUILD_NUMBER} has finished successfully </p>
                            <p> This is the job: ${env.JOB_URL}</p>                            
                    <body>
                <html>    
            """, 
            to: "myaremenko7@gmail.com",
            mimeType: 'text/html')
}