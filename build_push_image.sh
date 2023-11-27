#!bin/bash
# membuat Docker image dengan nama item-app dan tag v1
docker build -t item-app:v1 .

# melihat daftar image lokal
docker image ls --all

# Mengubah nama image agar sesuai dengan format
image_name="item-app:v1"


# Login ke GitHub
export CR_PAT=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
echo $CR_PAT | docker login ghcr.io -u amedfauzi --password-stdin

# Mengunggah ke Github Packages
docker tag item-app:v1 ghcr.io/amedfauzi/item-app:v1
docker push ghcr.io/amedfauzi/item-app:v1
