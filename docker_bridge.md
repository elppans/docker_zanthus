# Docker Bridge

Para criar uma rede do tipo bridge no Docker, você pode seguir os passos abaixo:

1. **Criar a Rede Bridge**:
   Use o comando `docker network create` seguido pelo nome da rede. Por exemplo:
   ```bash
   docker network create minha-rede-bridge
   ```

2. **Verificar a Rede Criada**:
   Para confirmar que a rede foi criada, você pode listar todas as redes disponíveis com:
   ```bash
   docker network ls
   ```

3. **Conectar um Contêiner à Rede Bridge**:
   Ao iniciar um contêiner, você pode conectá-lo à rede bridge criada usando a opção `--network`. Por exemplo:
   ```bash
   docker run -d --name meu-container --network minha-rede-bridge nginx
   ```

4. **Verificar a Conexão do Contêiner**:
   Para verificar se o contêiner está conectado à rede correta, use:
   ```bash
   docker network inspect minha-rede-bridge
   ```

Esses passos permitem criar e gerenciar redes bridge no Docker, facilitando a comunicação entre contêineres de forma isolada⁴⁶.



- Fontes  
(1) [Docker Network Bridge: Aprenda como criar e configurar redes no ... - Awari.](https://awari.com.br/docker-network-bridge-aprenda-como-criar-e-configurar-redes-no-docker/)  
(2) [Docker – de A a Z – 13 – Bridge Network - gaGO.io.](https://gago.io/blog/docker-az-13-bridge-network/)   
(3) [Docker - aula 04: Criando Redes (bridge). Como criar redes no Docker ....](https://www.youtube.com/watch?v=yQSBZoZWAbk)   
(4) [Aula 30 - Criando Redes no Docker | Curso Docker Essencial: Primeiros Passos.](https://www.youtube.com/watch?v=GqqLgRV52Y0)   
(5) [Applying Docker Networking | Bridge Network | Part 18 | Docker شرح.](https://www.youtube.com/watch?v=TSrW2tapx-8)   
(6) [Docker Network Bridge: Aprenda como criar e configurar redes no ... - Awari.](https://bing.com/search?q=Como+Criar+rede+Bridge+no+docker%3f) 
