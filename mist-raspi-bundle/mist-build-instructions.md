### Mist server build instructions for Raspberry Pi

> cd $MIST_DIRECTORY

> git init

> git remote add origin https://github.com/DDVTECH/mistserver.git

> git fetch  origin +refs/heads/catalyst:

> git checkout e064f8951738fc89605844891605e1150dd636b6 -b catalyst

> docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD

<blockquote>
docker buildx build --progress=plain --target=mist --build-arg BUILD_TARGET=static \
--build-arg STRIP_BINARIES=true --build-arg BUILD_VERSION=e064f8951738fc89605844891605e1150dd636b6 \
--tag livepeerci/mistserver:static-catalyst-arm64 --tag livepeerci/mistserver:static-e064f8951738fc89605844891605e1150dd636b6-arm64 \
--tag livepeerci/mistserver:static-e064f895-arm64 --tag livepeerci/mistserver:static-e064f8951738fc89605844891605e1150dd636b6-arm64 \
--tag livepeerci/mistserver:static-latest-arm64 --push .
</blockquote>
