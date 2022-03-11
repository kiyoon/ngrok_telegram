import socket
import requests

if __name__ == '__main__':
    req = requests.get('http://localhost:4040/api/tunnels')
    tunnels = req.json()
    print(f'{socket.gethostname()}')
    for tunnel in tunnels['tunnels']:
        #print(tunnel['proto'])
        print(tunnel['public_url'] + " -> " + tunnel['config']['addr'])
