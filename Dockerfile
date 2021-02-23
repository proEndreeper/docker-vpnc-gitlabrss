FROM phusion/baseimage:0.9.16

CMD ["/sbin/my_init"]

RUN apt-get update -y && apt-get install -y vpnc git
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

RUN mkdir -p /etc/service/
COPY discord-rss-fetcher /etc/service/discord-bot
COPY bin/discord-bot.sh /etc/service/discord-bot/run

# Setup vpnc service
RUN mkdir -p /etc/service/vpnc
COPY bin/vpnc.sh /etc/service/vpnc/run

# Clean up
RUN apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
