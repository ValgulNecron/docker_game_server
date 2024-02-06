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

RUN apt-get update && apt-get install -y mono-devel && apt-get clean && rm -rf /tmp/*

RUN mkdir /game/

RUN chmod 777 /game

RUN ./steamcmd.sh +force_install_dir /game/ +login anonymous +app_update 996560 validate +quit

RUN curl -L -o Exiled.tar.gz https://github.com/Exiled-Team/EXILED/releases/latest/download/Exiled.tar.gz

RUN mkdir -p /home/steam/Exiled \
    && tar -xzvf Exiled.tar.gz -C /home/steam/Exiled

RUN mkdir ~/.config/ && mkdir ~/.config/SCP\ Secret\ Laboratory/

RUN mv /home/steam/Exiled/SCP\ Secret\ Laboratory/* ~/.config/SCP\ Secret\ Laboratory/

RUN mkdir -p ~/.config && mv /home/steam/Exiled/EXILED/ ~/.config/SCP\ Secret\ Laboratory/EXILED

WORKDIR /home/steam/scp/

EXPOSE 7777

CMD ["/bin/sh", "-c", "/home/steam/scp/LocalAdmin 7777"]