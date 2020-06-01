FROM docker:19.03-dind

ARG version=v0.10.0

RUN apk add --update --no-cache curl && \
    curl -LO https://github.com/buildpacks/pack/releases/download/${version}/pack-${version}-linux.tgz && \
    tar xfz pack-${version}-linux.tgz && \
    mv pack /usr/bin/

RUN mkdir /work
COPY entrypoint.sh /work/entrypoint.sh
RUN chmod +x /work/entrypoint.sh

ENTRYPOINT [ "/work/entrypoint.sh" ]
