FROM grafana/grafana-enterprise

USER root
COPY grafana/scripts/grafana.ini.template /tmp/grafana.ini.template
COPY grafana/scripts/prep-grafana-ini.sh /usr/local/bin/
RUN prep-grafana-ini.sh

USER grafana