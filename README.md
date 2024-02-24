# Docker-Transmission
Simple Docker Transmission image based on Alpine.

## Introductions
This project aims to run commonly used NAS software in Docker.

## How to build

### Build command
`docker build -t ruantu/transmission:latest .`

## How to use

### Mapping port
- RPC Port: `9091 TCP`
- Peer Port: `9092 TCP/UDP`
- Local Service Discovery: `6771 UDP`

### Mounting volumes
- Watching directory for torrent files: `/root/downloads/watch`  
- Storing directory for completed tasks: `/root/downloads/complete`  
- Storing directory for incomplete tasks: `/root/downloads/incomplete`  
- Configuration file: `/root/.config/transmission-daemon/settings.json`  

### Software packages
- [transmission-cli](https://pkgs.alpinelinux.org/packages?name=transmission-cli&branch=edge&repo=&arch=&maintainer=)
- [transmission-daemon](https://pkgs.alpinelinux.org/packages?name=transmission-daemon&branch=edge&repo=&arch=&maintainer=)
- [transmission-extra](https://pkgs.alpinelinux.org/packages?name=transmission-extra&branch=edge&repo=&arch=&maintainer=)
- [transmission-remote](https://pkgs.alpinelinux.org/packages?name=transmission-remote&branch=edge&repo=&arch=&maintainer=)
