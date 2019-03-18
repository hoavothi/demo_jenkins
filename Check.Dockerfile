FROM fr/android-env

ENV PROJECT_DIR /project
RUN mkdir -p PROJECT_DIR

ENV GRADLE_USER_HOME /.gradle
RUN mkdir -p $GRADLE_USER_HOME

ENV GRADLE_USER_CACHE /.gradle_cache
RUN mkdir -p $GRADLE_USER_CACHE

CMD  rsync -a --include ${GRADLE_USER_CACHE}/ ${GRADLE_USER_HOME}/ || true && \
     cd /project && ./gradlew assembleDebug && \
     rsync -au ${GRADLE_USER_HOME}/ ${GRADLE_USER_CACHE}/ || true
