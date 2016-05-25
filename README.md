# platzhalter/anope Dockerfile

This repository contains the Dockerfile of [Anope](https://www.anope.org/) for running an own Anope server in a docker container.

## Base Image

I based my image on the [Debian 8 Jessie](https://registry.hub.docker.com/_/debian/) image.

## Usage

1. Create a folder containing all your configuration files used by [Anope](http://www.anope.org). It has to contain at least the `services.conf`-file, but you are free to use multiple configuration files and `include { }`-tags. Just make sure you're using absolute filepaths to make sure Anope will **always** be able to parse your configs.
2. Run it doing: `docker run -v /path/to/your/configuration/directory:/anope/conf **-v /path/to/data/directory:/anope/data** -d platzhalter/anope

## Notes

- You need to add a `/anope/data`-volume to make sure Anope can permanently save its data (for example NickServ accounts, etc.). If you don't, Anope will forget everything (including ChanServ channels, NickServ passwords, and so on) when restarted.
