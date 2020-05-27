FROM docker:19.03-dind

RUN apk add --update --no-cache curl && \
    curl -LO https://github.com/buildpacks/pack/releases/download/v0.10.0/pack-v0.10.0-linux.tgz && \
    tar xvf pack-v0.10.0-linux.tgz

RUN mkdir /work
COPY entrypoint.sh /work/entrypoint.sh
RUN chmod +x /work/entrypoint.sh

ENTRYPOINT [ "/work/entrypoint.sh" ]
