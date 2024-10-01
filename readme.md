# TODO
- CI/CD
- Automate telegram polls and meetup notifications
- Design messages

# How to run docker container

> **Note:** Change the environment variables with your own values

```bash
docker run -d \
--name telediscobot \
-e NODE_ENV=production \
-e DISCORD_API_TOKEN= \
-e TELEGRAM_API_TOKEN= \
-e TELEGRAM_CHAT_ID= \
telediscobot
```