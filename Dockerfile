FROM alpine:3.5
MAINTAINER Phillip Shipley <phillip_shipley@sil.org>

RUN apk update

RUN apk --no-cache add ca-certificates curl bash jq py2-pip

RUN pip install --upgrade pip==20.3.3 \
    && pip install awscli==1.18.39

COPY ecs-deploy /usr/local/bin/ecs-deploy

RUN chmod a+x /usr/local/bin/ecs-deploy

ENTRYPOINT ["/usr/local/bin/ecs-deploy"]
