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

# Cek argumen dari pemanggilan file
if [ -z "${1}" ]; then
    echo "Silahkan masukkan minimal 1 argumen berisi versi yang akan dibuild"
    exit 0
fi

# Melakukan docker login menggunakan provider Github Container Image Registery
echo $PASSWORD_DOCKER_HUB | docker login ghcr.io -u $USERNAME_DOCKER_HUB --password-stdin

# Build image
docker build -t ghcr.io/$USERNAME_DOCKER_HUB/item-app:v$1 .

# Push image ke Github Container Image Registery
docker push ghcr.io/$USERNAME_DOCKER_HUB/item-app:v$1
