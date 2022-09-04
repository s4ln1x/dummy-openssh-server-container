FROM centos:stream8

MAINTAINER "Salvador Gudino" <salvador.gudino.ochoa@gmail.com>

# Install ssh server
RUN dnf install -y openssh-server \
    vim

# Add new user with key
RUN useradd -m dummy
RUN usermod -aG root dummy
RUN gpasswd -a dummy root
RUN mkdir -p /home/dummy/.ssh/
RUN chmod 0700 /home/dummy/.ssh/
RUN chown -R dummy:dummy /home/dummy/.ssh/

# Regenerate server keys
RUN ssh-keygen -A

# Run ssh server
CMD ["/usr/sbin/sshd", "-D"]
