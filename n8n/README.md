# Export docker

export CONTAINER_ID=$(docker ps -f name=n8n --format "{{.ID}}") && \
docker exec -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true $CONTAINER_ID n8n export:workflow --all --output=workflow_bkp.json && \
docker container cp $CONTAINER_ID:/home/node/workflow_bkp.json ./workflow_bkp.json && \
docker exec -t -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true "$CONTAINER_ID" /usr/local/bin/n8n export:credentials --all --output=/home/node/credentials_bkp.json && \
docker cp "$CONTAINER_ID":/home/node/credentials_bkp.json ./credentials_bkp.json

# Import kubectl

export POD_ID=$(kubectl get pods -n apps  -o jsonpath='{.items[*].metadata.name}') && \
kubectl cp ./workflow_bkp.json apps/$POD_ID:/tmp/workflow_bkp.json  && \
kubectl exec -n apps -it $POD_ID -- sh -c 'export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false; n8n import:workflow --input=/tmp/workflow_bkp.json'   && \
kubectl cp ./credentials_bkp.json apps/$POD_ID:/tmp/credentials_bkp.json  && \
kubectl exec -n apps -it $POD_ID -- sh -c 'export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false;n8n import:credentials --input=/tmp/credentials_bkp.json'


# Logs vault
kubectl logs -n apps -c vault-agent-init $(kubectl get po -n apps -o jsonpath='{.items[*].metadata.name}')