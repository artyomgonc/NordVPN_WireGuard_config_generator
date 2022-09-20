#!/bin/bash

nordvpn connect "$1"

code="$1";
filename="NordVPN_${code^^}.conf"

ans="[Interface]\nAddress = 10.5.0.2/32\nDNS = 8.8.8.8\n"
ans="$ans$(wg showconf nordlynx | grep 'PrivateKey')\n"
ans="$ans$(wg showconf nordlynx | grep 'ListenPort')\n\n[Peer]\n"

reg1="peer:\s+(.*)"
tmp="$(wg show | grep 'peer:')"
if [[ $tmp =~ $reg1 ]]
then
	tmp="PublicKey = ${BASH_REMATCH[1]}"
	ans="$ans$tmp\n"
fi

ans="$ans$(echo -e 'AllowedIPs = 0.0.0.0/0')\n"

reg1="endpoint:\s+(.*)"
tmp="$(wg show | grep 'endpoint:')"
if [[ $tmp =~ $reg1 ]]
then
	tmp="Endpoint = ${BASH_REMATCH[1]}"
	ans="$ans$tmp\n"
fi

reg1=".*keepalive:[^0-9]*([0-9]+)[^0-9]*"
tmp="$(wg show | grep 'keepalive')"
if [[ $tmp =~ $reg1 ]]
then
	tmp="PersistentKeepalive = ${BASH_REMATCH[1]}"
	ans="$ans$tmp\n"
fi

echo -e $ans > $filename

nordvpn d

echo -e "Done: ./$filename"
