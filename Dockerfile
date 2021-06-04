FROM docker:20.10.3-dind

ENV VERSION=v0.19.0

RUN apk add --update --no-cache curl bash && \
    curl -LO https://github.com/buildpacks/pack/releases/download/${VERSION}/pack-${VERSION}-linux.tgz && \
    tar xfz pack-${VERSION}-linux.tgz && \
    mv pack /usr/bin/

RUN mkdir /work
COPY entrypoint.sh /work/entrypoint.sh
RUN chmod +x /work/entrypoint.sh

ENTRYPOINT [ "/work/entrypoint.sh" ]
