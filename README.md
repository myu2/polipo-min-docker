# polipo-min-docker
A minimum polipo docker image.

# Prepare the configration
Put your polipo config files to ./etc/polipo/{config,option} if you want.

# Build and run a docker container
```sh
git clone https://github.com/myu2/polipo-min-docker.git
docker build -t myu2/polipo-min-docker polipo-min-docker
docker run -d -p 8123:8123 -v `pwd`/etc/polipo:/etc/polipo  --name polipo-min myu2/polipo-min-docker
```

# Generate Dockefile
To update phusion/baseimage image.
```sh
git clone https://github.com/myu2/polipo-min-docker.git
cd polipo-min-docker && ./gen_dockerfile.sh
```
