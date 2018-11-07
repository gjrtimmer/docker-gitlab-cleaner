FROM registry.timmertech.nl/docker/alpine-base:latest

ARG BUILD_DATE
ARG VCS_REF
ARG DOCKER_ENGINE=18.06.1-r0
ARG START_TIMEOUT=300000

LABEL \
    maintainer="G.J.R. Timmer <gjr.timmer@gmail.com>" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name=gitlab-cleaner \
    org.label-schema.vendor=timmertech.nl \
    org.label-schema.url="https://gitlab.timmertech.nl/docker/gitlab-cleaner" \
    org.label-schema.vcs-url="https://gitlab.timmertech.nl/docker/gitlab-cleaner.git" \
    org.label-schema.vcs-ref=${VCS_REF} \
    nl.timmertech.license=MIT

ENV DOCKER_ENGINE_VERSION=${DOCKER_ENGINE} \
    S6_KILL_FINISH_MAXTIME=${START_TIMEOUT}

RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community'  >> /etc/apk/repositories && \
    apk upgrade --update --no-cache && \
    apk add --no-cache --update \
    dcron \
    docker@community=${DOCKER_ENGINE_VERSION} \

    # Install docker-compose
    py2-pip && \
    pip install --upgrade pip && \
    pip install docker-compose

RUN sed "s|ash|bash|" -i /etc/passwd && \
    ln -sf /data/.docker ~/.docker

COPY rootfs/ /

VOLUME [ "/data" ]

# EOF
