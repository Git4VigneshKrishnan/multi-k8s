docker build -t docker4vkrish/multi-client:latest -t docker4vkrish/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t docker4vkrish/multi-server:latest -t  docker4vkrish/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t docker4vkrish/multi-worker:latest -t docker4vkrish/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push docker4vkrish/multi-client:latest
docker push docker4vkrish/multi-client:$SHA
docker push docker4vkrish/multi-server:latest
docker push docker4vkrish/multi-server:$SHA
docker push docker4vkrish/multi-worker:latest
docker push docker4vkrish/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment server=docker4vkrish/multi-client:$SHA
kubectl set image deployments/server-deployment server=docker4vkrish/multi-server:$SHA
kubectl set image deployments/worker-deployment server=docker4vkrish/multi-worker:$SHA
