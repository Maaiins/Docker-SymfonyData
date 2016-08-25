FROM alpine:3.4

MAINTAINER Lauser, Nicolai <nicolai@lauser.info>

LABEL container_type="data"

RUN addgroup app-cache \
    && mkdir -p /app \
    && { \
        echo "#!/bin/sh"; \
        echo "rm -rf /app/var/logs/* /app/var/cache/*"; \
        echo "chown -R :app-cache /app/var"; \
    } > /permissions.sh \
    && chmod 775 /permissions.sh

VOLUME /app
WORKDIR /app

CMD ["/permissions.sh"]