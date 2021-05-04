FROM silintl/ubuntu:14.04
MAINTAINER Phillip Shipley <phillip_shipley@sil.org>

RUN apt-get update -y \
    && apt-get upgrade -y

RUN apt-get install -y wget python-setuptools build-essential zlib1g-dev

RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

RUN wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz \
    && tar xfz ./Python-2.7.9.tgz \
    && cd Python-2.7.9 \
    && ./configure  \
    && make \
    && sudo make install \
    && python --version

RUN apt-get update -y \
    && apt-get upgrade -y

RUN curl "https://bootstrap.pypa.io/pip/2.7/get-pip.py" -o "get-pip.py"
RUN python get-pip.py

RUN apt-get install -y \
        curl \
        python-setuptools \
        jq \
    && pip install --upgrade pip==20.3.3 \
    && pip install awscli==1.18.39

COPY ecs-deploy /usr/local/bin/ecs-deploy

RUN chmod a+x /usr/local/bin/ecs-deploy

ENTRYPOINT ["/usr/local/bin/ecs-deploy"]
