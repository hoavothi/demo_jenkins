
# Image names for docker
ENV_IMAGE_NAME=fr/android-env
CHECK_IMAGE_NAME=fr/android-check

####

#pre:  docker-env-image
check:  docker-check-image check-run


docker-env-image:
	@echo ":::Building Android Environment Images"
	docker build --rm -f Env.Dockerfile -t $(ENV_IMAGE_NAME) .

docker-check-image:
	@echo ":::Building Code check Images"
	docker build --rm -f Check.Dockerfile -t $(CHECK_IMAGE_NAME) .


check-run:
	@echo ":::Running Check Container"
	 pwd && cd /var/jenkins_home/workspace/demo_jenkins_test2-HKW52ZEPKO7VGTCD5TNSE4647HCWMVDJVIV75OPMX5YENCJH6IRA && ls -a
	 docker run -i --rm \
             -v $(shell pwd):/project \
             -v $(HOME)/.gradle:/.gradle_cache \
             $(CHECK_IMAGE_NAME)

