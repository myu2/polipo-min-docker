# polipo-min-docker
A minimum polipo docker image.

# Prepare
Configure your polipo config files to ./etc/polipo/{config,option} if you want.

# Build image
```sh
git clone https://github.com/myu2/polipo-min-docker.git
docker build -t myu2/polipo-min-docker polipo-min-docker
docker run -name polipo-min myu2/polipo-min-docker
```

# Generate Dockefile
```sh
git clone https://github.com/myu2/polipo-min-docker.git
cd polipo-min-docker && ./gen_dockerfile.sh
```
