#!/bin/bash
#
# This script creates the datasource.yml configuration file for grafana service.
#
# It requires the following environment variables to be defined
#
# GRAFANA_SERVICE_PORT              The grafana service port


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
s/\$GRAFANA_SERVICE_PORT/$(escape $GRAFANA_SERVICE_PORT)/g
EOF
}


set -e
main
