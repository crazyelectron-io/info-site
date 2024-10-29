ARG         ARCH=linux/amd64

FROM        registry.moerman.online/library/info-site:latest

RUN         apk update && apk add --no-cache --no-interactive \
            tzdata \
            tini \
            jq
COPY        bin/webhook /usr/local/bin/webhook

WORKDIR     /config
EXPOSE      9000

ENTRYPOINT  ["/sbin/tini", "--", "/usr/local/bin/webhook"]
CMD         ["-verbose", "-hotreload", "-hooks=hooks.yml"]