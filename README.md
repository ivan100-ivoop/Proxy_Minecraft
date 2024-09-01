# Proxy_Minecraft

A Docker-based proxy setup for Minecraft servers, allowing you to seamlessly integrate Ngrok or Playit proxies.

## Setup

### 1. Fix Permissions
- Before proceeding with the setup, ensure that the necessary scripts and binaries have executable permissions:

```bash
chmod +x data/bin/start.sh
```

### 2. Select Proxy Type
Choose your preferred proxy type: `playit` or `ngrok`. Set this in the `docker-compose.yml` file by updating the `proxy_type` variable:

```yaml
proxy_type: "<type>"  # Options: 'playit', 'ngrok'. Default: none
```

### 3. Ngrok Configuration
If you choose Ngrok, follow these steps:

- Obtain your Ngrok AuthToken from the [Ngrok Dashboard](https://dashboard.ngrok.com/get-started/your-authtoken).
- Update the Ngrok configuration file located at data/config/ngrok/ngrok.yml.
```yaml
authtoken: <AuthToken>
addr: <IP>:<PORT> # Replace with host ip and port of service example: 192.168.1.101:25565 
```
- The interface will be available at the following URL: http://<host_IP>:4040
- For example, if your host IP address is `192.168.1.101`, you can access the interface by navigating to: http://192.168.1.101:4040

### 4. Playit Configuration
If you opt for Playit, follow these steps:

- Run the Playit setup via the binary located at
```bash
./data/bin/playit
```
- Complete the setup in the [Playit.gg Web Interface](https://playit.gg/account/agents).
- Once configured, copy the Playit configuration file:
```bash
cp ~/.config//playit_gg/playit.toml data/config/playit/playit.toml
```

### 5. Run the Docker Container
- After completing the configuration:
```bash
docker-compose up -d
```

### 6. Create a Discord Webhook
- Go to your Discord server settings.
- Navigate to **Integrations** > **Webhooks**.
- Click **New Webhook** and configure it:
  - Choose the channel where you want to receive the notifications.
  - Copy the **Webhook URL**.

### 7. Configure the Webhook in Your Environment
- Add the following environment variables in your Docker environment or `docker-compose.yml` file:

```yaml
DSK_USERNAME: "<DISCORD_USERNAME>"  # Replace with the name for the webhook profile
DSK_IMAGE: "<DISCORD_PICTURE>"      # Replace with the image URL for the webhook profile
WEBHOOK_URL: "<DISCORD_WEBHOOK_URL>"  # Replace with the Webhook URL you copied earlier
```

### Extra Commands
```bash
docker attach MinecraftProxy
```
- `proxy <start, stop, status>`
- `getIP`

