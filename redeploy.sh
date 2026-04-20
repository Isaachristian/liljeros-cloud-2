#!/bin/zsh

echo "STOPPING AND REMOVING CONTAINERS"
podman quadlet rm -af

echo "INSTALLING QUADLETS"
podman quadlet install \
	actual.container \
	vaultwarden.container \
	seafile.network \
	seafile-db.container \
	seafile-memcached.container \
	seafile-app.container

echo "STARTING ACTUAL..."
systemctl --user start actual.service
echo "STARTING VAULTWARDEN..."
systemctl --user start vaultwarden.service
echo "STARTING SEAFILE NETWORK..."
systemctl --user start seafile-network.service
echo "STARTING SEAFILE DB..."
systemctl --user start seafile-db.service
echo "STARTING SEAFILE MEMCACHED..."
systemctl --user start seafile-memcached.service
echo "STARTING SEAFILE..."
systemctl --user start seafile-app.service

