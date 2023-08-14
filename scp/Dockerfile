FROM cm2network/steamcmd:root
LABEL authors="valgul"

RUN apt-get update && apt-get install -y \
    dirmngr \
    ca-certificates \
    gnupg \
    expect-dev \
    && rm -rf /var/lib/apt/lists/*

RUN gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list

RUN apt-get update

RUN apt-get install -y mono-devel

RUN rm -rf /tmp/*

RUN ./steamcmd.sh +force_install_dir /home/steam/scp +login anonymous +app_update 996560 +app_update 996560 validate +quit

RUN curl -L -o Exiled.Installer-Linux https://github.com/Exiled-Team/EXILED/releases/download/7.2.0/Exiled.Installer-Linux

RUN ./Exiled.Installer-Linux -p /home/steam/scp/

EXPOSE 7777

WORKDIR /home/steam/scp

CMD ["/bin/sh", "-c", "/home/steam/scp/LocalAdmin 7777"]