#!/bin/bash
#
# This script creates the datasource.yml configuration file for grafana service.
#
# It requires the following environment variables to be defined
#
# PROMETHEUS_HOST              The prometheus host
# PROMETHEUS_SERIVCE_PORT      The prometheus service port


main()
{
  expand_tmpl > /etc/grafana/provisioning/datasources/datasource.yml
  chmod a+r /etc/grafana/provisioning/datasources/datasource.yml
}


# escapes / and \ for sed script
escape()
{
  local var="$*"

  # Escape \ first to avoid escaping the escape character, i.e. avoid / -> \/ -> \\/
  var="${var//\\/\\\\}"

  printf '%s' "${var//\//\\/}"
}


expand_tmpl()
{
  cat <<EOF | sed --file - /tmp/datasource.yml.template
s/\$PROMETHEUS_HOST/$(escape $PROMETHEUS_HOST)/g
s/\$PROMETHEUS_SERIVCE_PORT/$(escape $PROMETHEUS_SERIVCE_PORT)/g
EOF
}


set -e
main
