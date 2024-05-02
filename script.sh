#!/bin/bash

echo "criando as imagens"

docker build -t ricardomarino/backend:1.0 backend/.
docker build -t ricardomarino/database:1.0 database/.

echo "realizando push"
docker push ricardomarino/backend:1.0
docker push ricardomarino/database:1.0

echo "services"
kubectl apply -f ./service.yml

echo "deployments"
kubectl apply -f ./deployment.yml
