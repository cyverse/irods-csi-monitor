FROM grafana/grafana-enterprise

COPY grafana/scripts/defaults.ini.template /tmp/defaults.ini.template
COPY grafana/scripts/prep-defaults.sh /usr/local/bin/
RUN prep-defaults.sh