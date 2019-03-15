
RUN mkdir -p /var/jenkins_home
RUN cd /var/jenkins_home

ENV PROJECT_DIR /project
RUN mkdir -p PROJECT_DIR

ENV GRADLE_USER_HOME /.gradle
RUN mkdir -p $GRADLE_USER_HOME

ENV GRADLE_USER_CACHE /.gradle_cache
RUN mkdir -p $GRADLE_USER_CACHE

WORKDIR /var/jenkins_home$PROJECT_DIR

CMD  touch bbb.txt && ls -a
