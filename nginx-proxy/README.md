
## docker-compose.yml

**需自行新增需要用到的port**

```yml

version: "3"
services:
  nginx:
    restart: always
    image: nginx:latest
    container_name: nginx
    ports:
      - 80:80   # add port
      - 81:81
    volumes:
      - ./conf.d:/etc/nginx/conf.d

```


## ServiceNameProxy.conf

**docker-compose.yml 每新增一組port，需要新增一組*.conf檔**
```conf
server {
    listen       80; # 進入點 port number
    server_name  domain.com; # 進入點
    location / {
        proxy_pass   http://proxy.domain:port; # 更改成需要proxy的位置
    }
}
```