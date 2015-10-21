#!/bin/sh
deploy_components () {
	docker stop aadc-components
	docker rm aadc-components

	echo -e '\n----------------------------------------------------------------'
	echo -e 'Running the aadc-components container with persistent storage on the host'
	echo -e '----------------------------------------------------------------'
	docker run \
		-d \
		-v /home/docker-data/aadc-components/git:/usr/share/nginx/html \
		-p 1000:80 \
		--name aadc-components \
		--restart=always \
		nginx:latest
}

mkdir -p /home/docker-data/aadc-components

# Call the function to deploy the application
deploy_components

# List the Docker containers
docker ps