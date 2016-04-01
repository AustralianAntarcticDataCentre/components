#!/bin/sh
deploy_components () {
	docker stop aadc-components
	docker rm aadc-components

	echo -e '\n----------------------------------------------------------------'
	echo -e 'Running the aadc-components container with persistent storage on the host'
	echo -e '----------------------------------------------------------------'
	docker run \
		-d \
		-v $DIR_MOUNT_GIT:/usr/share/nginx/html \
		-v $DIR_MOUNT_CONF:/etc/nginx/conf.d/default.conf \
		-p $COMPONENTS_PORT:80 \
		--name aadc-components \
		--restart=always \
		nginx:latest
}

mkdir -p $DIR_MOUNT_GIT

# Call the function to deploy the application
deploy_components

# List the Docker containers
docker ps