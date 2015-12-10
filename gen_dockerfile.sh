#/bin/sh
newest_ver=$(  \
curl -sL https://raw.githubusercontent.com/phusion/baseimage-docker/master/Changelog.md \
   | egrep '## [^ ]* ' \
   | awk '{print $2}' \
   | head -1
   )

if [ -z $newest_ver ]; then
  newest_ver=0.9.18   ## currently newest version 2015/12/10
fi

cat<<EOF > Dockerfile
## Newest version now
FROM phusion/baseimage:$newest_ver

RUN apt-get update -q && apt-get install -y polipo

RUN mkdir /etc/service/polipo
ADD polipo.sh /etc/service/polipo/run
ADD etc/polipo /etc/polipo/

## Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## addtional port
EXPOSE 8123

## init system
CMD ["/sbin/my_init"]

EOF
