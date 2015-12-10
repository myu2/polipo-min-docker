# polipo-min-docker
minimum polipo docker image.

# Prepare
Configure youre polipo configration to ./etc/polipo/{config,option}.

# Build image
```sh
git clone https://github.com/myu2/polipo-min-docker.git
docker build -t myu2/polipo-min-docker polipo-min-docker
docker run -name polipo-min myu2/polipo-min-docker
```
