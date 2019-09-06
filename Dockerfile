FROM centos:6
MAINTAINER "Michael A. Ventarola" <mikev1963@me.com>
ENV container docker

# Install requirements.
RUN yum makecache fast \
 && yum -y install deltarpm epel-release \
 && yum -y update \
 && yum -y install \
      sudo \
      redhat-lsb \
      openssh-server \
      which \
      rsyslog \
      bind-utils \
      net-tools \
      python-pip \
      filesystem \
 && yum clean all

# SSH login fix. Otherwise user is kicked off after login
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

# Install local users in container
COPY useradd.sh /
RUN chmod +x /useradd.sh && /useradd.sh

# Set Hostname
RUN sed --in-place '/HOSTNAME/d' /etc/sysconfig/network

EXPOSE 22
RUN chkconfig sshd on

VOLUME /run /tmp

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/sbin/init"]
