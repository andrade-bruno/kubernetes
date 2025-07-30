#!/bin/bash

restart_minikube() {
	echo "\nRestarting Minikube...\n"
	# minikube stop
	minikube delete
	minikube start --driver=docker --kubernetes-version=v1.27.0 --cpus=2 --memory=4048 --disk-size=20g
	echo "\nMinikube restarted successfully.\n"
}

build() {
	echo "\nRunning build command...\n"
	kubectl create -f namespaces/ --save-config
	kubectl create -f deployments/ --save-config
	kubectl create -f services/ --save-config
	echo "\nK8S Voting App is up and running!\n"
}
