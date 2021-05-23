# currently the latest LTS version
From ubuntu:20.04

# ???
#LABEL

# define argument variables
ARG TZ=America/Denver #time zone

# set environment variables
#ENV

# copy files to container
#COPY

# set timezone
# update/upgrade
# install stuff
# clean up

RUN ln -snf /usr/share/zoneinfo/"$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    apt -y update && \
    apt -y upgrade && \
    apt install -y default-jdk && \
    apt install -y screen && \
    apt install -y wget && \
    mkdir minecraft && \
    cd minecraft && \
    pwd && \
    wget https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar && \ 
    cp server.jar minecraft_server.1.16.5.jar && \
    #cp eula.txt eula.txt.old && \
    #rm eula.txt && \
    echo eula=true > eula.txt && \
    #pwd && \
    #ls
    apt -y autoremove --purge && \
    apt -y clean
	
# Expose server port
EXPOSE 25565
	
# start minecraft server
CMD java -Xmx1024M -Xms1024M -jar minecraft_server.1.16.5.jar nogui
