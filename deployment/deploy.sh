#!/bin/sh

docker stop aadc-components
docker rm  -f aadc-components

echo -e '\n----------------------------------------------------------------'
echo -e 'Running the aadc-components container with persistent storage on the host'
echo -e '----------------------------------------------------------------'
docker run \
	-d \
	-v %env.DIR_GIT%:/usr/share/nginx/html \
	-v %env.DIR_CONF%:/etc/nginx/conf.d/default.conf \
	-p %env.APP_PORT%:80 \
	--name aadc-components \
	--restart=always \
	nginx:latest
}

# List the Docker containers
docker ps