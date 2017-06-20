#!/bin/bash -e

if [ -n "$BUILD_NUMBER" ]; then
  echo "Building container v${BUILD_NUMBER}"
  docker build -t pactfoundation/pact-mock-service:$BUILD_NUMBER .
  docker tag -f pactfoundation/pact-mock-service:$BUILD_NUMBER pactfoundation/pact-mock-service:latest
  docker push pactfoundation/pact-mock-service:$BUILD_NUMBER
else
  echo "Building container with tag 'latest'"
  docker build -t pactfoundation/pact-mock-service:latest .
fi
#docker push pactfoundation/pact-mock-service:latest
