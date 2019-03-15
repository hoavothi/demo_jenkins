
# Image names for docker
ENV_IMAGE_NAME=fr/android-env
CHECK_IMAGE_NAME=fr/android-check
SC_IMAGE_NAME=fr/android-check-second

####

#pre:  docker-env-image
check: docker-env-image docker-check-image check-run


docker-env-image:
	@echo ":::Building Android Environment Images"
	docker build --rm -f Env.Dockerfile -t $(ENV_IMAGE_NAME) .

docker-check-image:
	@echo ":::Building Code check Images"
	docker build --rm -f Check.Dockerfile -t $(CHECK_IMAGE_NAME) .

	docker build --rm -f Second.Dockerfile -t $(SC_IMAGE_NAME) .

check-run:
	@echo ":::Running Check Container"
	 cd .. && ls -a && cd .. && ls -a && cd .. && ls -a && pwd && ls -a && pwd && cd /var/jenkins_home/workspace/demo_jenkins_test2-HKW52ZEPKO7VGTCD5TNSE4647HCWMVDJVIV75OPMX5YENCJH6IRA && ls -a
	 docker run --name android-check-abc -i --rm \
	         -v /var/jenkins_home:/var/jenkins_home \
             -v $(pwd):/var/jenkins_home/project \
             -v /var/run/docker.sock:/var/run/docker.sock \
             -v $(HOME)/.gradle:/.gradle_cache \
             $(SC_IMAGE_NAME)



