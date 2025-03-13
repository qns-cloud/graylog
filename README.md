# Overview

This is a mix of [graylog2 open-core](https://github.com/Graylog2/docker-compose/blob/main/open-core/docker-compose.yml) and [graylog2 docker install docs.](https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/docker_installation.htm)

# Data Persistence

This setup uses bind mounts to ensure data persistence between container restarts and even if Docker is restarted. All data is stored in the `./data` directory with subdirectories for each service:

- `./data/mongodb` - MongoDB data (Graylog configuration, including inputs)
- `./data/opensearch` - OpenSearch data (log storage)
- `./data/graylog` - Graylog-specific data

# Usage

Before starting the containers for the first time, run the setup script to create the necessary directories:

```
chmod +x setup.sh
./setup.sh
```

Then start the Graylog stack:

```
docker compose up
```

Access graylog [here.](http://localhost:9001)

> **Note:** The web interface is available on port 9001, not 9000 as previously mentioned.

## Input Configuration

Any input configurations you create will now be persisted between container restarts, ensuring you don't lose your setup when restarting the services.

## NXLOG Configuration

nxlog.conf is the Window NXLOG configuration for sending GELF format logs to Graylog. Replace the default C:\Program Files\nxlog\conf\nxlog.conf with the one https://raw.githubusercontent.com/lawrencesystems/graylog/master/nxlog.conf and change the IP address to match your Graylog server.
