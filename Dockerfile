FROM docker:29.1.4-dind

ENV VERSION=v0.39.1

RUN apk add --update --no-cache curl bash && \
    curl -LO https://github.com/buildpacks/pack/releases/download/${VERSION}/pack-${VERSION}-linux.tgz && \
    tar xfz pack-${VERSION}-linux.tgz && \
    mv pack /usr/bin/

RUN mkdir /work
COPY entrypoint.sh /work/entrypoint.sh
RUN chmod +x /work/entrypoint.sh

ENTRYPOINT [ "/work/entrypoint.sh" ]
