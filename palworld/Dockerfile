FROM cm2network/steamcmd:root
LABEL authors="valgul"

ENV PORT=8211
ENV PLAYER=32

RUN apt-get update && apt-get install -y \
    dirmngr \
    ca-certificates \
    gnupg \
    expect-dev \
    && rm -rf /var/lib/apt/lists/*

RUN gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
 && echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list

RUN apt-get update \
    && apt-get install -y mono-devel \
    && apt-get clean \
    && rm -rf /tmp/*

WORKDIR /home/steam/steamcmd

RUN mkdir /game/

RUN ./steamcmd +force_install_dir /game/ +login anonymous +app_update 2394010 validate +quit

WORKDIR /game/

RUN mkdir -p ~/.steam/sdk64/ \
steamcmd +login anonymous +app_update 1007 +quit \
cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/

CMD ["/bin/sh", "-c", "/game/PalServer.sh -port=$PORT -players=$PLAYER -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS	"]