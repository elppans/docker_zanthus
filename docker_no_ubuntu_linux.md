# Docker no Ubuntu Linux

## Remvover Docker versão Snap:
```bash
sudo snap remove docker
```
## Adicionando chave GPG do Docker:
```bash
sudo apt-get update
```
```bash
sudo apt-get install ca-certificates curl
```
```bash
sudo install -m 0755 -d /etc/apt/keyrings
```
```bash
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
```
```bash
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
## Adicionando reositório:
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
```bash
sudo apt-get update
```
## Instalando:
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Criando o grupo docker e adicionando o usuário nele:
```bash
sudo groupadd docker
```
```bash
sudo usermod -aG docker $USER
```

## Ajuste as permissões do socket do Docker:
```bash
sudo chmod 666 /var/run/docker.sock
```

## Ativar serviço:
```bash
sudo systemctl enable --now docker.service containerd.service
```
```bash
systemctl status docker.service containerd.serviceb
```
## Configurando docker-compose
```bash
ls /usr/bin/docker-compose*
```
```bash
ls /usr/local/bin/docker-compose*
```
```bash
sudo ln -sfv /usr/libexec/docker/cli-plugins/* /usr/local/bin/
```
## Teste:
```bash
docker run hello-world
```
## Informações:
```bash
docker info
```
## Login:
```bash
docker login -u usuário_docker
```
>{senha}

## Subir o docker configurado no .yml:
```bash
cd /docker
```
```bash
docker-compose up -d
```
