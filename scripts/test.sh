#docker build -t pactfoundation/pact-mock-service:latest .
PACT_CONT_NAME=pact-mock-service
PORT_BIND="1234:1234"
docker run --privileged --name=${PACT_CONT_NAME} -d -p ${PORT_BIND} pactfoundation/pact-mock-service
