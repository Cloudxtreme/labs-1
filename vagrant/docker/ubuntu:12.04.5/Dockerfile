FROM ubuntu:12.04.5

RUN \
  apt-get update && \
  apt-get install -y openssh-server vim && \
  apt-get clean 

RUN \
  mkdir -p /var/run/sshd  && \
  echo "#!/bin/bash\nexec /usr/sbin/sshd -D" > /usr/sbin/services-sshd && \
  chmod u+x /usr/sbin/services-sshd

RUN \
  apt-get install sudo && \
  useradd -m ubuntu -G sudo -s /bin/bash && \
  echo 'ubuntu ALL = NOPASSWD: ALL' >> /etc/sudoers && \
  echo 'ubuntu:password' | chpasswd
  
CMD ["/usr/sbin/services-sshd"]

