FROM devlio/customubuntu:UBUNTU_14-PYTHON_2_7_18

RUN pip install awscli==1.18.39

COPY ecs-deploy /usr/local/bin/ecs-deploy

RUN chmod a+x /usr/local/bin/ecs-deploy

ENTRYPOINT ["/usr/local/bin/ecs-deploy"]
