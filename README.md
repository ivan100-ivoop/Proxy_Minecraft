# Proxy_Minecraft

A Docker-based proxy setup for Minecraft servers, allowing you to seamlessly integrate Ngrok or Playit proxies.

## Setup

### 1. Fix Permissions
- Before proceeding with the setup, ensure that the necessary scripts and binaries have executable permissions:

```bash
chmod +x data/*/*.*
```

### 2. Select Proxy Type
Choose your preferred proxy type: `playit` or `ngrok`. Set this in the `docker-compose.yml` file by updating the `proxy_type` variable:

```yaml
proxy_type: "<type>"  # Options: 'playit', 'ngrok'. Default: none
```

### 3. Ngrok Configuration
If you choose Ngrok, follow these steps:

- Obtain your Ngrok AuthToken from the [Ngrok Dashboard](!https://dashboard.ngrok.com/get-started/your-authtoken).
- Update the Ngrok configuration file located at data/config/ngrok/ngrok.yml.

### 4. Playit Configuration
If you opt for Playit, follow these steps:

- Run the Playit setup via the binary located at
```bash
./data/bin/playit
```
- Complete the setup in the [Playit.gg Web Interface](!https://playit.gg/account/agents).
- Once configured, copy the Playit configuration file:
```bash
cp ~/.config/playit/playit.toml data/config/playit/playit.toml
```

### 5. Run the Docker Container
- After completing the configuration:
```bash
docker-compose up -d
```

### Additional Information
- **Ngrok**: A tunneling service that allows you to expose a local server to the internet.
- **Playit**: An easy-to-use service for creating tunnels to your local servers.

