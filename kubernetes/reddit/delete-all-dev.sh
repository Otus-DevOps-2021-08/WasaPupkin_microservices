#!/bin/bash
kubectl delete -n dev -f comment-deployment.yml \
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

kubectl delete -f ./dev-namespace.yml
