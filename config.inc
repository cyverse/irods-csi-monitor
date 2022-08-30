#!/bin/bash

export ENV_NAME=cyverse_csi_prometheus
export DOMAIN="$ENV_NAME"_default

export PROMETHEUS_SERIVCE_PORT=2022
export PROMETHEUS_CONF_HOST="$ENV_NAME"_prometheus_1."$DOMAIN"
