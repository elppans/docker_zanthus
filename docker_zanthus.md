# Manager Docker  

### Para usar o Manager, deve [instalar o docker no Linux](https://github.com/elppans/zretail/blob/master/docker_centos-oracle_Linux.md).  

Nomenclatura do manager, versao:  
>Exemplo  

```
2.14.156.138(RADEZ-58)-23178
```

Dividimos assim:  

```
2.14. |156. |138 |(RADEZ-58)- |23178
```

Onde cada campo representa:  

>2.14 > Versao do PAF  
156 > Versao minima de banco  
138 > Versao do manager   
(RADEZ-58) Versao do Radez  
23178 > Release  

Pacote Docker Zanthus (Versão de 10.01.24):  

```
curl -JOLk https://www.dropbox.com/scl/fi/5x4rxiitz4pwzvfwpmu8e/demonstracao_100124.1437-33.tar.gz?rlkey=en59mqtt6fp24rg4cc5rqwjet&dl=0
sudo tar -zxvf demonstracao_100124.1437-33.tar.gz -C /opt
sudo chown -R $USER:$USER /opt/demonstracao
```

Edição do docker manager:  
>Não usa mais Zend e Apache  

- Siglas:  

```
PGS = Banco PostgreSQL
SQL = Banco SQL
ORA = Oracle
```

Acessar o diretório onde contém o `.yml` do docker da Zanthus  
Editar os principais pontos do arquivo docker_composer.yml  

#### manager_1:  

>Endereço e imagem Docker Manager (Sempre configurar a imagem mais atual):
>
```
image: zanthusinovacao1/managerweb:PGS_8_1.23_158_139d_m
```

#### ports:  

>Porta do servidor httpd (NGinx):

```
- "80:80"
```

#### environment:  

>IP do servidor de Memcache (Normalmente é o IP do Manager local):
- MEMCACHE_IP=192.168.10.252:11211

>IP e porta do servidor Manager:
```
- IP_SERVIDOR=192.168.10.252
- PORTA_SERVIDOR=80
```

>Outros

```
- HABILITAR_MIRAGE=true
- NOME_CLIENTE=PDVTec_Homologacao
```

- Não é necessário modificar outras informações deste arquivo  

#### ZMWSInfo/Banco do Manager:

Edite o arquivo `../manager/ZMWSInfo_manager_1.ini`  
Modifique o campo User e Passwd para o acesso do Manager ao banco  
Modifique o IP, para apontar onde será o Banco do Manager  
Modifique o nome do Banco para o que vai usar  
A opção `[SERVIDOR]`, deixar o código no valor padrão 1  
NOMEMINI e NOME, adicione o nome da loja  
A opção `[MIRAGE_S]`, deixar ativo e modificar o IP do Hosts para apontar o servidor Mirage (Normalmente é o mesmo IP do servidor Manager)  


#### IP do Manager no Balanceador (OPCIONAL)  

Editar o arquivo `../balanceador/nginx_balanceador.conf`, linha 35:  

```
server 192.168.10.252:80 max_fails=1 fail_timeout=5;
```
## Executar Docker Manager  

Executar dentro do diretório onde está o arquivo "docker_composer.yml", o comando para logar no Docker da Zanthus  

```
docker login
```

>Adicione o usuário e senha do docker  
>>nome: USER  
>>senha: PASSWORD  

Executar para iniciar a imagem:  

```
docker-compose up -d
```
Verificar Status do Docker Manager:  

```
docker-compose ps
```

Verificar serviços rodando dentro do docker  
>Verificar o ID do container
```
docker ps
```

Parar todos os serviços docker:  

```
docker-compose down
```
Acessar o container:  

```
docker exec -it ID_do_COntainer /bin/bash
```
### Scripts

Instalar o pacote firewalld e executar o script [manager_firewallD.sh](https://raw.githubusercontent.com/elppans/zretail/master/manager_firewallD.sh) para configurar as portas necessárias.  
Executar o script [debian_configure_power_settings.sh](https://raw.githubusercontent.com/elppans/customshell/master/debian_configure_power_settings.sh) para configurar `hibernação`, `suspensão` e `HandleLidSwitch` no Debian.  
Se necessário usar porta diferente do padrão 80 no Manager, executar o Script [manager_firewallD_redirect_port.sh](https://raw.githubusercontent.com/elppans/zretail/master/manager_firewallD_redirect_port.sh) (Padrão 8080 > 80)

- [Docker iptables](https://dev.to/soerenmetje/how-to-secure-a-docker-host-using-firewalld-2joo)

Após instalar e configurar o FirewallD, **crie/edite** o arquivo `/etc/docker/daemon.json` e adicione este conteúdo:  

```
{
"iptables": false
}
```

Após configurar o arquivo, faça um restart do serviço docker:  

```
sudo systemctl restart docker
```

### Outras informações  

[Docker_manager-Kernel_Carga {TXT}](https://www.dropbox.com/scl/fi/hh1jw8xizes9r1lrnbkr4/Docker_manager-Kernel_Carga.txt?rlkey=du61n2e75h3qn87q8fmjoj4od&dl=0)  
[Docker_manager_Geracao_do_SDF {TXT}](https://www.dropbox.com/scl/fi/tab28tpwykgl6waotungs/Docker_manager_Geracao_do_SDF.txt?rlkey=wkttyb9n7y8xcgmxcot6hhiyw&dl=0)  
[docker_nome-cliente_manager {TXT}](https://www.dropbox.com/scl/fi/z9ij786ps3npjb7i6prxt/docker_nome-cliente_manager.txt?rlkey=6l7zx41kscn6kc4ebdvncc2ms&dl=0)  
[docker_erro-saving_credentials-docker-credential-desktop_NOT_FOUND {TXT}](https://www.dropbox.com/scl/fi/cvf7rssx19fnj7zckiak1/docker_erro-saving_credentials-docker-credential-desktop_NOT_FOUND.txt?rlkey=a4e9aa26eudz7tq4muxjg93le&dl=0)  
[docker_comunicacao_443 {TXT}](https://www.dropbox.com/scl/fi/4ayl0q5hn4opcmxtr0blx/docker_comunicacao_443.txt?rlkey=w74n616xa2mzw1uyxi5z1f7es&dl=0)  
