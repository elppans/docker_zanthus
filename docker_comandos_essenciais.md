# Docker, Comandos Essenciais

1) Parar os containers do docker-compose em execução

```bash
docker-compose down
```

2) Limpar referencias que não estão sendo utilizadas

Pode executar enquanto o docker ativo. Esse comando remove todos os contêineres parados, mas não afeta os contêineres que estão em execução.

```bash
docker container prune --force
```

3) Apaga todas as imagens e arquivos do docker, se for iniciar novamente irá baixar as imagens novamente 

Ele força a remoção de todas as imagens Docker, incluindo aquelas que estão em uso por contêineres parados. No entanto, ele não afeta os contêineres em execução diretamente.
Pode executar esse comando enquanto o Docker está ativo, mas é importante estar ciente de que ele pode causar problemas se houver contêineres que dependem dessas imagens. 
Então, é recomendável parar o conteiner para executar este comando.

```bash
docker rmi -f $(docker images -a -q)
```
4) Inicializa os containers que estão inclusos no docker compose

```bash
docker-compose up -d
```
