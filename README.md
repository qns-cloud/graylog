# Overview

This is a mix of [graylog2 open-core](https://github.com/Graylog2/docker-compose/blob/main/open-core/docker-compose.yml) and [graylog2 docker install docs.](https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/docker_installation.htm)

# Data Persistence

This setup uses bind mounts to ensure data persistence between container restarts and even if Docker is restarted. All data is stored in the `./data` directory with subdirectories for each service:

- `./data/mongodb` - MongoDB data (Graylog configuration, including inputs)
- `./data/opensearch` - OpenSearch data (log storage)
- `./data/graylog` - Graylog-specific data

# Usage

## Local Deployment

Before starting the containers for the first time, run the setup script to create the necessary directories:

```
chmod +x setup.sh
./setup.sh
```

Then start the Graylog stack:

```
docker compose up
```

## Portainer Deployment

To deploy this stack using Portainer:

1. Ensure Docker Swarm is initialized on your host:
   ```
   docker swarm init
   ```

2. In Portainer:
   - Go to Stacks > Add Stack
   - Choose "Git Repository" as the build method
   - Set the following parameters:
     - **Name**: graylog (or your preferred stack name)
     - **Repository URL**: Your GitHub repository URL
     - **Repository Reference**: The branch (e.g., main, master)
     - **Compose Path**: docker-compose.yml
     - **Orchestrator**: Select **Swarm** (not Compose) - this is critical!
   - Click "Deploy the stack"

> **Important Notes:**
> - Make sure the repository contains the `config/graylog/graylog.conf` file
> - The stack must be deployed as a Swarm stack, not a Compose stack
> - Docker will automatically create and manage volumes for data persistence

Access graylog at http://your-server-ip:9001 (replace with your actual server IP)

> **Note:** The web interface is available on port 9001, not 9000 as previously mentioned.

## Input Configuration

Any input configurations you create will now be persisted between container restarts, ensuring you don't lose your setup when restarting the services.

## NXLOG Configuration

nxlog.conf is the Window NXLOG configuration for sending GELF format logs to Graylog. Replace the default C:\Program Files\nxlog\conf\nxlog.conf with the one https://raw.githubusercontent.com/lawrencesystems/graylog/master/nxlog.conf and change the IP address to match your Graylog server.
