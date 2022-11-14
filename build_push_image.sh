#!/bin/sh

# Cek jika environment USERNAME_DOCKER_HUB agar tidak kosong
if [ -z "${USERNAME_DOCKER_HUB}" ]; then
    echo "USERNAME_DOCKER_HUB masih kosong"
    echo "Silahkan isi terlebih dahulu dengan export USERNAME_DOCKER_HUB=\"ISI USERNAME\" "

    exit 0
fi

# Cek jika environment PASSWORD_DOCKER_HUB agar tidak kosong
if [ -z "${PASSWORD_DOCKER_HUB}" ]; then
    echo "PASSWORD_DOCKER_HUB masih kosong"
    echo "Silahkan isi terlebih dahulu dengan export PASSWORD_DOCKER_HUB=\"ISI TOKEN\" "

    exit 0
fi

# Build image
docker build -t item-app:v1 .

# Melihat daftar image di local
docker images -a

# Rename image name, using Github Container Image Registery
docker image tag item-app:v1 ghcr.io/$USERNAME_DOCKER_HUB/item-app:v1

# Melakukan docker login menggunakan provider Github Container Image Registery
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u $USERNAME_DOCKER_HUB --password-stdin

# Push image ke Github Container Image Registery
docker push ghcr.io/$USERNAME_DOCKER_HUB/item-app:v1
