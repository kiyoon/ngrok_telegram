# Ngrok_telegram

Open ports (SSH, http etc.) and send remote address to Telegram.

# Requirements

Python 3

```bash
pip3 install requests
```

# Usage
1. Setup ngrok token by running `ngrok config add-authtoken`.
2. Modify `config.yml`.
3. Make `telegram_key.ini` and write `token` and `chat_ids`. Refer to `telegram_key.ini.template
4. Run `ngrok_telegram.sh`
