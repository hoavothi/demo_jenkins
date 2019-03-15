
# Image names for docker
ENV_IMAGE_NAME=fr/android-env
CHECK_IMAGE_NAME=fr/android-check
SC_IMAGE_NAME=fr/android-check-second

####

check: docker-env-image docker-check-image check-run


docker-env-image:
	@echo ":::Building Android Environment Images"
	docker build --rm -f Env.Dockerfile -t $(ENV_IMAGE_NAME) .

docker-check-image:
	@echo ":::Building Code check Images"
	docker build --rm -f Check.Dockerfile -t $(CHECK_IMAGE_NAME) .

check-run:
	@echo ":::Running Check Container"
	 rsync -avzh $(pwd) /tmp/
	 docker run --name android-check-abcd -i --rm \
	                    -v /tmp/:/tmp/ \
                        $(CHECK_IMAGE_NAME)
