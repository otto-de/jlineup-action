#!/bin/sh -l

echo "Running JLineup with url $1"

RESULT=$(OPENSSL_CONF=/dev/null java -jar jlineup-cli.jar --url $1)

echo ::set-output name=result::$RESULT
