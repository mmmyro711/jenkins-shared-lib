def notificationsSend() {
    def buildStatus = currentBuild.result

    if (buildStatus == 'SUCCESS') {
        echo 'Build succeeded'
    } else if (buildStatus == 'FAILURE') {

    } else if (buildStatus == 'UNSTABLE') {
        echo 'Build is unstable'

    } else {
        echo 'Build status is unknown or not available.'
    }
}