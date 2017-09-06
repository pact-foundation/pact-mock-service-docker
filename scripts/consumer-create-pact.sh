#!/usr/bin/env bash
set -e

# clear interactions (not necessary for this example, just showing how)
curl -X DELETE -H "X-Pact-Mock-Service: true"  localhost/interactions
echo ""

# set up interaction
curl -X POST -H "X-Pact-Mock-Service: true" -d@scripts/consumer-interaction.json localhost/interactions
echo ""

# execute interaction
curl localhost/foo
echo ""

# verify interaction took place
curl -H "X-Pact-Mock-Service: true" localhost/interactions/verification
echo ""

# write pact
curl -X POST -H "X-Pact-Mock-Service: true" -d '{"consumer": {"name": "Foo"}, "provider": {"name": "Bar"}}' localhost/pact
echo ""
