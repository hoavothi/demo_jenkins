FROM fr/android-env

ENV PROJECT_DIR /project
RUN mkdir -p PROJECT_DIR

ENV GRADLE_USER_HOME /.gradle
RUN mkdir -p $GRADLE_USER_HOME

ENV GRADLE_USER_CACHE /.gradle_cache
RUN mkdir -p $GRADLE_USER_CACHE

COPY Gemfile* /tmp/

WORKDIR /tmp
RUN bundle check || bundle install --path vendor/bundle

CMD  echo ${JENKINS_URL} && cd .. && cp -R ${GRADLE_USER_CACHE}/caches ${GRADLE_USER_CACHE}/wrapper ${GRADLE_USER_HOME} || true && \
     cd /project && \
     echo "CLEAN " && \
     ./gradlew clean :app:check || exit 1 && \
     bundle exec danger && \
     rsync -au ${GRADLE_USER_HOME}/caches ${GRADLE_USER_HOME}/wrapper ${GRADLE_USER_CACHE}/ || true
