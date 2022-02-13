#!/bin/bash
kubectl apply -f ./dev-namespace.yml
# install ingress
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.1/deploy/static/provider/cloud/deploy.yaml
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingressnginx/controller-v0.34.1/deploy/static/provider/cloud/deploy.yaml

kubectl apply -n dev -f comment-deployment.yml \
  -f comment-deployment.yml \
  -f comment-mongo-service.yml \
  -f mongo-deployment.yml \
  -f mongo-service.yml \
  -f post-deployment.yml \
  -f post-service.yml \
  -f post-mongo-service.yml \
  -f ui-deployment.yml \
  -f ui-service.yml \
  -f ui-ingress.yml \
  -f mongo-network-policy.yml \
  -f persitent-volume.yml \
  -f persitent-volume-claim.yml

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=178.154.200.201"
