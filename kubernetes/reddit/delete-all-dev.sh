#!/bin/bash
kubectl delete -n dev -f comment-deployment.yml \
  -f comment-mongo-service.yml \
  -f comment-service.yml \
  -f mongo-deployment.yml \
  -f mongo-service.yml \
  -f mongo-network-policy.yml \
  -f post-deployment.yml \
  -f post-service.yml \
  -f post-mongo-service.yml \
  -f ui-deployment.yml \
  -f ui-service.yml \
  -f ui-ingress.yml \
  -f mongo-claim.yml \
  -f mongo-volume.yml

kubectl delete -f ./dev-namespace.yml
