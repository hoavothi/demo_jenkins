
# Image names for docker
ENV_IMAGE_NAME=fr/android-env
CHECK_IMAGE_NAME=fr/android-check
SC_IMAGE_NAME=fr/android-check-second

####

check: docker-env-image docker-check-image check-run
e: docker-volume


docker-env-image:
	@echo ":::Building Android Environment Images"
	docker build --rm -f Env.Dockerfile -t $(ENV_IMAGE_NAME) .

docker-check-image:
	@echo ":::Building Code check Images"
	docker build --rm -f Check.Dockerfile -t $(CHECK_IMAGE_NAME) .

docker-volume:
	@echo ":::Building Android Volume"
	docker volume create DataVolume

check-run:
	@echo ":::Running Check Container"
	 docker run --name android-check -i --rm\
     	                    -v /tmp/data/$(shell PWD##*/):/project \
                             $(CHECK_IMAGE_NAME)

