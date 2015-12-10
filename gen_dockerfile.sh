#/bin/sh
newest_ver=$(  \
curl -sL https://raw.githubusercontent.com/phusion/baseimage-docker/master/Changelog.md \
   | egrep '## [^ ]* ' \
   | awk '{print $2}' \
   | head -1
   )
$newest_img

if [ $newest_img -z ]; then
newest_img=0.9.18   ## currently newest version 2015/12/10
fi

cat<<EOF > Dockerfile
## Newest version now
FROM phusion/baseimage:$newest_img

RUN apt-get update && apt-get install -y polipo

RUN mkdir /etc/service/polipo
ADD polipo.sh /etc/service/polipo/run
ADD etc/polipo /etc/polipo/

CMD ["/sbin/my_init"]

EXPOSE 8123

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EOF
