#!/bin/bash
set -e

# navigate to repo root and fetch lates change
cd  $(git rev-parse --show-toplevel)

git checkout main
git pull origin main

# install dependencies
dotnet restore Hng.Csharp.Web.sln

# build app
dotnet build -c Release

# publish app
dotnet publish -c Release

# restart the systemd service
sudo systemctl restart hng-web

