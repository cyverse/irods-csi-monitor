#!/bin/bash

export ENV_NAME=irods_monitor
export DOMAIN="$ENV_NAME"_default

export PROMETHEUS_SERIVCE_PORT=9090
export PROMETHEUS_CONF_HOST="$ENV_NAME"_prometheus_1."$DOMAIN"

export GRAFANA_SERVICE_PORT=3000
export GRAFANA_ADMIN_USERNAME=admin
export GRAFANA_ADMIN_PASSWORD=admin_password
export GRAFANA_CONF_HOST="$ENV_NAME"_grafana_1."$DOMAIN"
