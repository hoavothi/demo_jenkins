
# Image names for docker
ENV_IMAGE_NAME=fr/android-env
CHECK_IMAGE_NAME=fr/android-check

####

check: docker-env-image docker-check-image check-run


docker-env-image:
	@echo ":::Building Android Environment Images"
	sudo docker build --rm -f Env.Dockerfile -t $(ENV_IMAGE_NAME) .

docker-check-image:
	@echo ":::Building Code check Images"
	sudo docker build --rm -f Check.Dockerfile -t $(CHECK_IMAGE_NAME) .


check-run:
	@echo ":::Running Check Container"
	sudo docker run -i --rm \
        -v $(shell pwd):/project \
        -v $(HOME)/.gradle:/.gradle_cache \
        --env-file env.list \
        -e JENKINS_URL=$(JENKINS_URL) \
        $(CHECK_IMAGE_NAME)

