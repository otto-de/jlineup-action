#!/bin/sh -l

echo "Running JLineup with config $1"

RESULT=$(OPENSSL_CONF=/dev/null java -jar /jlineup-cli.jar --config $1 --step $2 --working-dir "$GITHUB_WORKSPACE"/"$3"/)

if [ $2 = "after" ]; then
  DIFFERENCE=$(jq -r '.summary."difference-sum"' "${GITHUB_WORKSPACE}/${3}/report/report.json")
  ERROR=$(jq -r .summary.error "${GITHUB_WORKSPACE}/${3}/report/report.json")
  if [ "$ERROR" = "true" ]; then
    SUCCESS=false
  else
    SUCCESS=true
  fi
  echo "difference=$DIFFERENCE" >> $GITHUB_ENV
  echo "success=$SUCCESS" >> $GITHUB_ENV
fi

echo "result<<EOF" >> $GITHUB_ENV
echo "$RESULT" >> $GITHUB_ENV
echo "EOF" >> $GITHUB_ENV
echo "workspace=$3" >> $GITHUB_ENV
