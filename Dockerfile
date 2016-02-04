FROM hernad/trusty_i386

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
    apt-get install -y curl git zip unzip build-essential bison flex libcups2-dev libcurl4-nss-dev libssl-dev libmysqlclient-dev libx11-dev


RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list &&\
    apt-get install -y wget ca-certificates &&\
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - &&\
    apt-get -y update &&\
    apt-get -y upgrade &&\
    apt-get install -y postgresql-9.5 libpq-dev

RUN echo "!/bin/bash" > /usr/bin/arch && \
    echo "echo i686" >> /usr/bin/arch && \
    chmod +x /usr/bin/arch

# no sudo password for users in wheel group
RUN sed -i 's/# %sudo ALL=(ALL) NOPASSWD: ALL/%admin ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers
RUN sed -i 's/%sudo.*ALL=(ALL:ALL) ALL/%sudo ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers

RUN useradd -ms /bin/bash -G adm,sudo docker

RUN mkdir -p /opt/hb32 &&\
   chown docker /opt/hb32

RUN apt-get install -y debhelper gcc-multilib

USER docker

#ENV HB_USER_CFLAGS=-m32  HB_USER_LDFLAGS='-m32'

ENV HB_TAR_VER=3.4.0-7
RUN cd /home/docker && curl -L https://bintray.com/artifact/download/hernad/deb/harbour_${HB_TAR_VER}.tar.gz | tar -xzf -


ADD set_*.sh build_*.sh /


RUN cd /home/docker/harbour-core &&\
    /build_harbour.sh


