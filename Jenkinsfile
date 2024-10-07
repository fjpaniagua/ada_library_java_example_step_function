#!/usr/bin/env groovy

@Library(["osiris-core-module@release/ada", "osiris-k8s-module"]) _

adanode("java11") {
    try {
        stage('Checkout') {
            checkout scm
        }
        dev("pipeline")
    } finally {
        cleanWs()
    }
}