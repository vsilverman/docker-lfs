#!/usr/bin/env groovy

properties([
    buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5')),
    pipelineTriggers([cron('@daily')]),
])

node('docker') {
    deleteDir()

    stage('Checkout') {
        checkout scm
    }

}
