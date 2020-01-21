FROM archlinux

RUN pacman -Syu --noconfirm --noprogressbar --quiet git pacman devtools python python-pip base-devel
RUN useradd --create-home build

# Build aurbot
USER build
WORKDIR /home/build
RUN mkdir -p /home/build/.gnupg/
RUN echo "keyserver-options auto-key-retrieve" >> /home/build/.gnupg/gpg.conf
RUN git clone https://github.com/kenn7/aurbot.git
WORKDIR aurbot
RUN makepkg

# Install aurbot
USER root
RUN pacman -U *.pkg.tar.xz --noconfirm
RUN echo "Set disable_coredump false" >> /etc/sudo.conf
RUN echo "build ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

#add commit script
ADD ./commit.sh /commit.sh
RUN chmod +x /commit.sh

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

USER build
CMD ["/usr/bin/aurbot"]

