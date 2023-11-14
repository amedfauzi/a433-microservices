#!bin/bash
# membuat Docker image dengan nama item-app dan tag v1
docker build -t item-app:v1 .

# melihat daftar image lokal
docker image ls --all

image_name="item-app:v1"

export CR_PAT=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
echo $CR_PAT | docker login ghcr.io -u amedfauzi --password-stdin
docker tag item-app:v1 ghcr.io/amedfauzi/item-app:v1
docker push ghcr.io/amedfauzi/item-app:v1

# Commit and push your changes to GitHub
#git init
#git add .
#git add .github/workflows/release-package.yml
#git add .npmrc or package.json
#git commit -m "built and pushed by script"
#git push -f