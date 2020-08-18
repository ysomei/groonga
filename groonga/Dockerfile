# Dockerfile
# install and running groonga container
FROM groonga/groonga:latest

# patch -> https://okamuuu.hatenablog.com/entry/2017/11/13/185903
ADD ./stack-fix.c /lib/stack-fix.c
RUN set -ex \
    && apk add --no-cache --virtual .build-deps build-base \
    && gcc -shared -fPIC /lib/stack-fix.c -o /lib/stack-fix.so \
    && apk del .build-deps
ENV LD_PRELOAD /lib/stack-fix.so

# startup script
RUN mkdir -p /mnt/db
ADD ./groonga.sh /etc/init.d/groonga.sh

EXPOSE 10041
ENTRYPOINT /etc/init.d/groonga.sh start && tail -f /dev/null

