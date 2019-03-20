
# Image names for docker
ENV_IMAGE_NAME=fr/android-env
CHECK_IMAGE_NAME=fr/android-check
SC_IMAGE_NAME=fr/android-check-second

####

check: docker-check-image check-run
pre-env: docker-env-image


docker-env-image:
	@echo ":::Building Android Environment Images"
	docker build --rm -f Env.Dockerfile -t $(ENV_IMAGE_NAME) .

docker-check-image:
	@echo ":::Building Code check Images"
	docker build --rm -f Check.Dockerfile -t $(CHECK_IMAGE_NAME) .

check-run:
	 @echo ":::Running Check Container"
	 docker run -i --rm \
     	   -v /tmp/data/$(shell echo "$${PWD##*/}"):/project \
     	   -v /tmp/data/.gradle:/.gradle_cache \
           -e DANGER_GITHUB_API_TOKEN="1812cdb041404bf15e5f5682ff99f9efad1701ee"\
           -e JENKINS_URL=$(JENKINS_URL) \
            $(CHECK_IMAGE_NAME)

