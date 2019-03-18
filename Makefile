
# Image names for docker
ENV_IMAGE_NAME=fr/android-env
CHECK_IMAGE_NAME=fr/android-check
SC_IMAGE_NAME=fr/android-check-second

####

check: docker-env-image docker-check-image check-run
pre-env: docker-env-image


docker-env-image:
	@echo ":::Building Android Environment Images"
	docker build --rm -f Env.Dockerfile -t $(ENV_IMAGE_NAME) .

docker-check-image:
	@echo ":::Building Code check Images"
	docker build --rm -f Check.Dockerfile -t $(CHECK_IMAGE_NAME) .

check-run:
	 @echo ":::Running Check Container"
	 docker run --name android-check -i --rm \
     	                    -v /tmp/data/$(shell echo "$${PWD##*/}"):/project \
     	                    -v /tmp/data/.gradle:/.gradle_cache \
                             $(CHECK_IMAGE_NAME)

