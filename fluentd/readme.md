To create Nginx pod that loads a custom landing page and use Fluentd to send the Nginx access logs to the Elasticsearch and user can access the logs via Kibana dashboard.

This example leverages an Elasticsearch and Kibana that are deployed in the same Kubernetes cluster

Steps of execution:

1） fluentd image:
docker build . -t derence/fluentd #Please use your own tag
docker push derence/fluentd

2) nginx configmap and deployment:
kubectl apply -f configmap.yaml #Feel free to customize the default loading page
kubectl apply -f deployment.yaml 

3) fluentd namespace, rbac, configmap and daemonset:
kubectl apply -f namespace.yaml #this creates fluentd namespace 
kubectl apply -f rbac.yaml 
kubectl apply -f configmap.yml 
kubectl apply -f daemonset.yml 

4) Run the test:
kubectl exec -it nginx-pod-name -- curl http://localhost #run this as many times as you wish

5) Load the Kibana dashboard, you should be able to see the access logs

6) To create elasticsearch and kibana in the same K8S cluster:
kubectl apply -f namespace.yaml #this creates elastic-kibana namespace

kubectl apply -f elasticsearch.yaml
kubectl apply -f kibana.yaml

7) Port forward the kibana service
kubectl -n elastic-kibana port-forward svc/kibana 5601 &
