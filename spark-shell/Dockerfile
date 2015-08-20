FROM spark-base:latest
MAINTAINER Kushal Mangtani <kushal.mangtani@viasat.com>

# Add the scripts
ADD start-shell.sh /start-worker.sh
ADD remove_alias.sh /remove_alias.sh

CMD ["/start-shell.sh"]
