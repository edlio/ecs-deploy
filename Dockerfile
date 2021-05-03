FROM silintl/ubuntu:14.04
MAINTAINER Phillip Shipley <phillip_shipley@sil.org>

RUN echo "$HOME"
RUN curl "https://files.pythonhosted.org/packages/ca/1e/d91d7aae44d00cd5001957a1473e4e4b7d1d0f072d1af7c34b5899c9ccdf/pip-20.3.3.tar.gz#sha256=79c1ac8a9dccbec8752761cb5a2df833224263ca661477a2a9ed03ddf4e0e3ba" > pip-20.3.3.tar.gz
RUN ls -l

RUN apt-get update -y \
    && apt-get install -y \
        curl \
        python-setuptools \
        jq \
        python-pip \
    && pip install --force-reinstall pip-20.3.3.tar.gz \
    && pip --version \
    && pip install awscli==1.18.39

COPY ecs-deploy /usr/local/bin/ecs-deploy

RUN chmod a+x /usr/local/bin/ecs-deploy

ENTRYPOINT ["/usr/local/bin/ecs-deploy"]
