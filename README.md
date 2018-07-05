docker-ccloud
-------------

Docker image of Confluent's `ccloud` CLI: [docs](https://docs.confluent.io/current/cloud/using/index.html#ccloud-cli)

Run it like: `docker run --rm -it -e "CCLOUD_BOOTSTRAP_SERVERS=my-cluster.confluent.cloud:9092" -e "CCLOUD_API_KEY=my-key" -e "CCLOUD_API_SECRET=my-secret" dylanmei/ccloud -v topic list`
