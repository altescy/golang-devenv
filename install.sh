#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/altescy/golang-devenv/master/.gitignore > ${pwd}/.gitignore
curl -fsSL https://raw.githubusercontent.com/altescy/golang-devenv/master/Dockerfile > ${pwd}/Dockerfile
curl -fsSL https://raw.githubusercontent.com/altescy/golang-devenv/master/Makefile > ${pwd}/Makefile
