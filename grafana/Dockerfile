FROM grafana/grafana-enterprise

ARG GRAFANA_ADMIN_USERNAME=admin
ARG GRAFANA_ADMIN_PASSWORD=admin
ARG GRAFANA_SERVICE_PORT=3000
ARG PROMETHEUS_HOST=localhost
ARG PROMETHEUS_SERIVCE_PORT=9090

USER root
COPY grafana/scripts/grafana.ini.template /tmp/grafana.ini.template
COPY grafana/scripts/prep-grafana-ini.sh /usr/local/bin/
RUN prep-grafana-ini.sh

COPY grafana/scripts/datasource.yml.template /tmp/datasource.yml.template
COPY grafana/scripts/prep-datasource-yaml.sh /usr/local/bin/
RUN prep-datasource-yaml.sh

USER grafana