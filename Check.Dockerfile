FROM fr/android-env

ENV PROJECT_DIR /project
RUN mkdir -p PROJECT_DIR

ENV GRADLE_USER_HOME /.gradle
RUN mkdir -p $GRADLE_USER_HOME

ENV GRADLE_USER_CACHE /.gradle_cache
RUN mkdir -p $GRADLE_USER_CACHE

CMD   cp -R ${GRADLE_USER_CACHE}/caches ${GRADLE_USER_CACHE}/wrapper ${GRADLE_USER_HOME} || true && \
     cd /project && bundle check || bundle install &&\
     echo "CLEAN " && \
     ./gradlew clean :app:check || exit 1 && \
     bundle exec danger && \
     rsync -au ${GRADLE_USER_HOME}/caches ${GRADLE_USER_HOME}/wrapper ${GRADLE_USER_CACHE}/ || true
