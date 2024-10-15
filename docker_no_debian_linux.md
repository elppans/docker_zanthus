# Docker no Debian Linux

#### Instalar pacotes para permitir uso de repositório por HTTPS

```bash
sudo apt update
```
```bash
sudo apt install ca-certificates curl gnupg
```
#### Adicionar chave GPG oficial do Docker

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```
```bash
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

#### Adicionar repositório:

```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
#### Atualizar indice de pacotes

```bash
sudo apt update
```
### Instalação do pacote:

#### Debian:

Instalar a versão mais recente

```bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
Verificar a instalação

Verifique se a instalação do Docker Engine foi bem-sucedida executando a imagem "hello-world"

```bash
sudo docker run hello-world
```
Este comando baixa uma imagem de teste e a executa em um contêiner. Quando o contêiner é executado, ele imprime uma mensagem de confirmação e sai.

## Opcional

* Gerenciar o Docker como um usuário não root

Crie o grupo docker e adicione o usuário  nele

```bash
sudo groupadd docker
```
```bash
sudo usermod -aG docker $USER
```
Faça logout e login novamente para que as novas permissões entrem em vigor.  
Verifique se você pode executar o docker sem sudo.  

```bash
docker run hello-world
```
Se não for, verifique as permissões do socket do Docker:  
```bash
ls -l /var/run/docker.sock
```
Ajuste as permissões do socket do Docker, se necessário:  
```bash
sudo chmod 666 /var/run/docker.sock
```
## Configurar o Docker para iniciar com systemd  

### Ativar serviço:

```bash
sudo systemctl enable --now docker.service containerd.service
```
```bash
systemctl status docker.service containerd.service
```
```bash
docker info
```
### Comando docker-compose

Verificar se o comando está em /usr/bin:

```bash
file /usr/bin/docker-compose
```
Se não estiver na pasta, faça um link:

```bash
sudo ln -sfv /usr/libexec/docker/cli-plugins/* /usr/bin/
```

Fontes:  

https://docs.docker.com/engine/install/debian/
https://docs.docker.com/engine/install/linux-postinstall/
