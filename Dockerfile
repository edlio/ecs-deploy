FROM silintl/ubuntu:14.04

RUN apt-get update -y \
    && apt-get install -y wget \ 
    libreadline-gplv2-dev \ 
    libncursesw5-dev\ 
    libssl-dev \ 
    libsqlite3-dev \
    tk-dev \ 
    libgdbm-dev \ 
    libc6-dev \ 
    libbz2-dev 

# Install python 
RUN wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz \
    && tar xfz ./Python-2.7.18.tgz \
    && cd Python-2.7.18 \
    && ./configure  \
    && make \
    && sudo make install \
    && python --version \
    && cd .. \
    && rm -rf Python-2.7.18

# Install pip
RUN curl "https://bootstrap.pypa.io/pip/2.7/get-pip.py" -o "get-pip.py" \
    && python get-pip.py \
    && pip install --upgrade pip==20.3.3 

RUN apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install awscli==1.18.39

COPY ecs-deploy /usr/local/bin/ecs-deploy

RUN chmod a+x /usr/local/bin/ecs-deploy

ENTRYPOINT ["/usr/local/bin/ecs-deploy"]
