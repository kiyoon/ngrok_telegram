#!/bin/bash

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
echo "Starting ngrok"
ngrok start --all --config "$HOME/.ngrok2/ngrok.yml" --config "$SCRIPT_DIR/config.yml" > /dev/null &

# Wait for ngrok to be available
while ! nc -z localhost 4040; do
  sleep 0.2 # wait Ngrok to be available
done

python3 telegram_post.py --title 'Ngrok URL' --body "$(python3 "$SCRIPT_DIR/read_ngrok_url.py")"
