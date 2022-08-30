#!/bin/bash
#
# This script creates the defaults.ini configuration file for grafana service.
#
# It requires the following environment variables to be defined
#
# GRAFANA_ADMIN_USERNAME            The admin username
# GRAFANA_ADMIN_PASSWORD            The admin password


main()
{
  expand_tmpl > /usr/share/grafana/conf/defaults.ini
  chmod a+r /usr/share/grafana/conf/defaults.ini
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
  cat <<EOF | sed --file - /tmp/defaults.ini.template
s/\$GRAFANA_ADMIN_USERNAME/$(escape $GRAFANA_ADMIN_USERNAME)/g
s/\$GRAFANA_ADMIN_PASSWORD/$(escape $GRAFANA_ADMIN_PASSWORD)/g
EOF
}


set -e
main
