FROM archlinux

# USER root

RUN pacman -Syu --noconfirm --noprogressbar --quiet git jq python-systemd pyalpm pacutils pacman python-pip aria2 devtools expac parallel repose vifm python base-devel
RUN useradd --create-home build
RUN usermod -g wheel build

# Build aurbot
USER build
WORKDIR /home/build
RUN mkdir -p /home/build/.gnupg/
RUN echo "keyserver-options auto-key-retrieve" >> /home/build/.gnupg/gpg.conf
RUN git clone https://github.com/seblu/aurbot.git
WORKDIR aurbot
RUN makepkg

# Install aurbot
USER root
RUN pacman -U *.pkg.tar.xz --noconfirm
RUN echo "Set disable_coredump false" >> /etc/sudo.conf
RUN echo "build ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

# Add Tini
# ENV TINI_VERSION v0.18.0
# ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
# RUN chmod +x /tini
# ENTRYPOINT ["/tini", "--"]

# RUN systemctl enable aurbot.service
USER build
RUN mkdir -p /home/build/repo/
CMD ["/usr/bin/aurbot","--debug"]

