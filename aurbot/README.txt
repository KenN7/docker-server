> docker build .
> docker run -ti -v "/home/ken/depots/aurbot/aurbot.conf:/etc/aurbot.conf" -v "/home/ken/depots/aurbot/files/:/home/build/" -e AURBOT_DATADIR='/home/build/data/' IMAGE_ID
