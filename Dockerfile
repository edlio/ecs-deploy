FROM silintl/ubuntu:14.04
MAINTAINER Phillip Shipley <phillip_shipley@sil.org>

RUN apt-get update -y \
    && apt-get install -y \
        curl \
        python-setuptools \
        jq \
    && pip install --upgrade pip==20.3.3 \
    && pip install awscli==1.18.39

COPY ecs-deploy /usr/local/bin/ecs-deploy

RUN chmod a+x /usr/local/bin/ecs-deploy

ENTRYPOINT ["/usr/local/bin/ecs-deploy"]
