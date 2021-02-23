#!/bin/sh

cat > /etc/service/discord-bot/config.json <<EOF
{
   "token": "${DISCORD_TOKEN}",
   "dbConnectionString": "nedb://nedb-data",
   "serviceName": "RSS Fetcher",
   "requiredPermissions": 84992,
   "askTimeoutMs": 30000,
   "dbClientConfig": {
      "compactionWriteCount": 100
   }
}
EOF

cd /etc/service/discord-bot/
exec /usr/bin/npm run full-start
