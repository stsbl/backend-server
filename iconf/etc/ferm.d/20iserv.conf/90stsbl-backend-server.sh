#!/bin/sh

# Restrict SSH on hosts under stsbl.de to local network except for
# router.stsbl.de which acts as safe habour for broken VPN for now
if [ "$(hostname -d)" = "stsbl.de" ] && ! [ "$(hostname)" = "router.stsbl.de" ]
then
  cat <<EOT
# Return before server-ferm SSH accept
domain (ip ip6) table filter chain input_world proto tcp dport ssh RETURN;

EOT
fi

exit 0
