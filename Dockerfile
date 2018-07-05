FROM confluentinc/cp-base

ENV COMPONENT="ccloud"

RUN groupadd -r ccloud && useradd --no-log-init -m -r -g ccloud ccloud

ARG CCLOUD_VERSION="0.2.1"

RUN curl -sL --retry 3 \
  "https://s3-us-west-2.amazonaws.com/confluent.cloud/cli/ccloud-${CCLOUD_VERSION}.tar.gz" \
  | gunzip \
  | tar x -C /usr/ \
 && sed -i 's/DIR\=.*/DIR\=\/usr\/ccloud-\${CCLOUD_VERSION}/' /usr/ccloud-${CCLOUD_VERSION}/bin/ccloud \
 && ln -s /usr/ccloud-${CCLOUD_VERSION}/bin/ccloud /usr/bin/ccloud

COPY include/etc/confluent/docker /etc/confluent/docker

USER ccloud
WORKDIR /home/ccloud

#CMD ["/etc/confluent/docker/run"]
ENTRYPOINT ["/etc/confluent/docker/run"]
