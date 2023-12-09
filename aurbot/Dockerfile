FROM archlinux:base-devel
SHELL ["/bin/bash", "-c"]
RUN pacman -Sy archlinux-keyring --noconfirm && pacman -Syu --noconfirm

#add multilib 32bit support
RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
RUN pacman -Sy --noconfirm --noprogressbar --quiet git pacman devtools python
RUN useradd --create-home build
RUN echo "Set disable_coredump false" >> /etc/sudo.conf
RUN echo "build ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

# Build aurbot
USER build
WORKDIR /home/build
RUN mkdir -p /home/build/.gnupg/
RUN echo "keyserver-options auto-key-retrieve" >> /home/build/.gnupg/gpg.conf
RUN git clone https://github.com/kenn7/aurbot.git
WORKDIR aurbot

# Install aurbot
USER root
RUN install -Dm755 aurbot /usr/bin/aurbot

#add commit script
ADD ./commit.sh /commit.sh
RUN chmod +x /commit.sh

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

WORKDIR /home
USER build
CMD ["/usr/bin/aurbot"]

