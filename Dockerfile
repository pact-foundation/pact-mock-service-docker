FROM ruby:2-alpine

COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN apk add --no-cache --virtual build-dependencies build-base && \
    gem install bundler --no-ri --no-rdoc && \
    cd /app; bundle install && \
    gem uninstall bundler && \
    apk del build-dependencies build-base && \
    rm -r ~/.bundle/ /usr/local/bundle/cache

WORKDIR /app

#Allow child docker files & command line invocations to override the port 
ENV EXPOSED_SERVICE_PORT=80
EXPOSE ${EXPOSED_SERVICE_PORT}

CMD bundle exec pact-mock-service service --host 0.0.0.0 --port $EXPOSED_SERVICE_PORT --pact-dir ./pacts
