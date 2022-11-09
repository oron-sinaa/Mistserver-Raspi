#!/bin/sh

echo "============================="
echo "--- MIST BUNDLE INSTALLER ---"
echo "============================="

echo "Building from scratch could take around 20 minutes on a raspberry pi 4, please be patient!"

	# > Extract the package to "X"
	sudo tar -xvf mist-raspi-bundle.tar.gz

	# > Install docker (run get-docker.sh)
	cd mist-raspi-bundle
	./get-docker.sh

	# > Install ffmpeg
	sudo apt install ffmpeg

	# > Run docker buildx command
	cd mistserver

	sudo docker buildx build --progress=plain --target=mist --build-arg BUILD_TARGET=static \
	--build-arg STRIP_BINARIES=true --build-arg BUILD_VERSION=e064f8951738fc89605844891605e1150dd636b6 \
	--tag livepeerci/mistserver:static-catalyst-arm64 --tag livepeerci/mistserver:static-e064f8951738fc89605844891605e1150dd636b6-arm64 \
	--tag livepeerci/mistserver:static-e064f895-arm64 --tag livepeerci/mistserver:static-e064f8951738fc89605844891605e1150dd636b6-arm64 \
	--tag livepeerci/mistserver:static-latest-arm64 --push .

	# > Run docker image (change 7503m to 95% of your total RAM)
	sudo docker run --restart always --shm-size=7503m --net=host livepeerci/mistserver:static-catalyst-arm64


