#!/bin/bash
#
# This script creates the grafana.ini configuration file for grafana service.
#
# It requires the following environment variables to be defined
#
# GRAFANA_ADMIN_USERNAME            The admin username
# GRAFANA_ADMIN_PASSWORD            The admin password
# GRAFANA_SERVICE_PORT              The service port


main()
{
  expand_tmpl > /etc/grafana/grafana.ini
  chmod a+r /etc/grafana/grafana.ini
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
  cat <<EOF | sed --file - /tmp/grafana.ini.template
s/\$GRAFANA_ADMIN_USERNAME/$(escape $GRAFANA_ADMIN_USERNAME)/g
s/\$GRAFANA_ADMIN_PASSWORD/$(escape $GRAFANA_ADMIN_PASSWORD)/g
s/\$GRAFANA_SERVICE_PORT/$(escape $GRAFANA_SERVICE_PORT)/g
EOF
}


set -e
main
