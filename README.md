# Ngrok_telegram

Open ports (SSH, http etc.) and send remote address to Telegram.

## Requirements

Python 3

```bash
pip3 install requests
```

## Usage
1. Setup ngrok token by running `ngrok config add-authtoken`.
2. Modify `config.yml`.
3. Make `telegram_key.ini` and write `token` and `chat_ids`. Refer to `telegram_key.ini.template
4. Run `ngrok_telegram.sh`

### Run on reboot

1. Replace `$HOME` to a non-variable absolute path in `ngrok_telegram.sh`
2. Add a file like this at `/etc/systemd/system/ngrok.service`

```ini
[Unit]
Description=ngrok
Wants=network-online.target
After=network-online.target

[Install]
WantedBy=multi-user.target

[Service]
ExecStart=/bin/bash /home/kiyoon/bin/ngrok_telegram/ngrok_telegram.sh
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
IgnoreSIGPIPE=true
Restart=on-failure
RestartSec=3
Type=simple
```

3. Run

```bash
sudo systemctl daemon-reload
sudo systemctl start ngrok.service
sudo systemctl enable ngrok.service
```
