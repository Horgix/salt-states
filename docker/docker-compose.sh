#! /bin/sh
docker run -it --rm -v /srv/docker_volumes/compose:/srv -v /var/run/docker.sock:/var/run/docker.sock docker/compose:1.8.0-rc1 -f /srv/docker-compose.yml $@
