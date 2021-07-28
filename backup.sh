#!/bin/bash
source .env
./stop.sh
docker run --rm \
  -v trilium:/data \
  -v ${VOLUME_DIR}:/backup ubuntu bash \
  -c "cd /data && tar cvf /backup/trilium-$(date +"%m_%d_%Y").tar ."
docker run --rm \
  -v jellyfin-config:/data \
  -v ${VOLUME_DIR}:/backup ubuntu bash \
  -c "cd /data && tar cvf /backup/jellyfin-config-$(date +"%m_%d_%Y").tar ."
echo "Now backup ${VOLUME_DIR} somewhere and run the ./start script"
