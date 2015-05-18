# Pull base image.
FROM ubuntu:15.04

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

# Install Chromium.
RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable && \
  apt-get clean

RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&\
  sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" > /etc/apt/sources.list.d/hangouts.list' && \
  sudo apt-get update && \
  sudo apt-get install google-talkplugin 

CMD ["/usr/sbin/services-sshd"]
