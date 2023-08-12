FROM cm2network/steamcmd:root
LABEL authors="valgul"

RUN apt-get update && apt-get install -y \
    dirmngr \
    ca-certificates \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list

RUN apt-get update

RUN apt-get install -y mono-devel

RUN rm -rf /tmp/*

RUN su steam

RUN ./steamcmd.sh +force_install_dir /home/steam/scp +login anonymous +app_update 996560 +app_update 996560 validate +quit

COPY entrypoint.sh /home/steam/entrypoint.sh
RUN chmod +x /home/steam/entrypoint.sh

EXPOSE 7777

ENTRYPOINT ["/home/steam/entrypoint.sh"]