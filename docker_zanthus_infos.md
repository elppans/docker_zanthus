# Docker Zanthus Infos

- Veja o "leiame.txt"
- Repositório: [zanthusinovacao1/managerweb](https://hub.docker.com/repository/docker/zanthusinovacao1/managerweb/general)
- Site: [docker](https://www.docker.com/)
___
## Converter Manager source para docker

Deve desativar o apache e memcached para habilitar o manager do Docker:  
```bash
systemctl status apache
```
```bash
systemctl stop apache
```
```bash
systemctl disable apache
```
```bash
systemctl status memcached
```
```bash
systemctl stop memcached
```
```bash
systemctl disable memcached
```
