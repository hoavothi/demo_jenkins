FROM fr/android-env

ENV PROJECT_DIR /project
RUN mkdir -p PROJECT_DIR

ENV GRADLE_USER_HOME /.gradle
RUN mkdir -p $GRADLE_USER_HOME

ENV GRADLE_USER_CACHE /.gradle_cache
RUN mkdir -p $GRADLE_USER_CACHE

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle check || bundle install

CMD  cd / && pwd && ls -a && rsync -a --include ${GRADLE_USER_CACHE}/caches  --include ${GRADLE_USER_CACHE}/wrapper --exclude ${GRADLE_USER_CACHE}/*/ ${GRADLE_USER_HOME} || true && \
     cd /project && \
     echo "CLEAN " && \
     ./gradlew clean :app:check || exit 1 && \
      echo "EXEC BUND" && bundle exec danger pr https://github.com/hoavothi/demo_jenkins/pull/4 && \
     rsync -au ${GRADLE_USER_HOME}/caches ${GRADLE_USER_HOME}/wrapper ${GRADLE_USER_CACHE}/ || true
