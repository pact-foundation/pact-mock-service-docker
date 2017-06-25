# Pact Mock Service Docker

Docker image running the pact mock service. You can pull the latest image from [Dockerhub][dockerhub].

## Usage

    $ docker-compose up

Test that mock service is running

    $ DOCKER_CONTAINER_IP=$(docker-machine ip default) # or localhost if using Docker native
    $ curl -H "X-Pact-Mock-Service: true" http://${DOCKER_CONTAINER_IP}

Get pact contents

    $ curl  -X POST \
            -H "X-Pact-Mock-Service: true" \
            -H "Content-Type: application/json" -d '{"consumer" : {"name": "Consumer Name"}, "provider": {"name": "Provider Name"}, "pact_dir": "/tmp/pacts"}' \
            http://${DOCKER_CONTAINER_IP}/pact

For examples of the other commands, see this [gist](https://gist.github.com/bethesque/9d81f21d6f77650811f4)

[dockerhub]: https://hub.docker.com/r/pactfoundation/pact-mock-service