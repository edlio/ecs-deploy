FROM devlio/ecs-ubuntu:ECS_DEPLOY

RUN pip install awscli==1.18.39

COPY ecs-deploy /usr/local/bin/ecs-deploy

RUN chmod a+x /usr/local/bin/ecs-deploy

ENTRYPOINT ["/usr/local/bin/ecs-deploy"]
