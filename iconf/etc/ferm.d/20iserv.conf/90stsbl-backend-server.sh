#!/bin/sh

# Restrict SSH on hosts under stsbl.de to local network
if [ "$(hostname -d)" = "stsbl.de" ]
then
  cat <<EOT
# Return before server-ferm SSH accept
domain (ip ip6) table filter chain input_world proto tcp dport ssh RETURN;

EOT
fi

exit 0
