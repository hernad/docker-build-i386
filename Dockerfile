FROM hernad/trysty_i386

RUN echo "#!/bin/bash" > /bin/uname  &&\
  echo "case \"\$1\" in" >> /bin/uname &&\
  echo " -s )" >> /bin/uname  &&\
  echo "   echo \"Linux\" ;; " >> /bin/uname &&\
  echo " -m ) " >> /bin/uname  &&\
  echo "   echo \"i686\" ;; " >> /bin/uname  &&\
  echo " -r ) " >> /bin/uname   &&\
  echo "   echo \"3.13.0-24-generic\" ;;" >> /bin/uname &&\
  echo " * )" >> /bin/uname &&\
  echo "  echo \"Linux ubuntu1404-vbox-i386-1 3.13.0-24-generic #47-Ubuntu SMP Fri May 2 23:31:42 UTC 2014 i686 i686 i686 GNU/Linux\" ;; " >> /bin/uname &&\
  echo "esac" >> /bin/uname &&\
  chmod +x /bin/uname

RUN apt-get update -y &&\
    apt-get install -y curl git zip unzip libpq-dev build-essential bison flex libcups2-dev libcurl4-nss-dev libssl-dev libmysqlclient-dev libx11-dev

# no sudo password for users in wheel group
RUN sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers

RUN useradd -ms /bin/bash docker

RUN mkdir -p /opt/hb32 &&\
   chown docker /opt/hb32

USER docker
ENV HB_TAR_VER=3.4.0-7
RUN cd /home/docker && curl -L https://bintray.com/artifact/download/hernad/deb/harbour_${HB_TAR_VER}.tar.gz | tar -xzf -



ADD set_*.sh build_*.sh /


RUN cd /home/docker/harbour-core &&\
    /build_harbour.sh

