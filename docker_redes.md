# Docker, Redes

1) Verificar as Redes Existentes

Listar todas as redes criadas pelo Docker

```bash
docker network ls
```

2) Remover Redes Desnecessárias

```bash
docker network rm <network_name>
```
3) Configurar Redes Personalizadas

Para evitar a criação de interfaces indesejadas, você pode criar redes personalizadas e especificar exatamente como os contêineres devem se conectar a elas.  
Use o comando docker, `network create <network_name>` para criar uma nova rede e `docker run --network <network_name>` para conectar um contêiner a essa rede.  
