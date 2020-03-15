# MeCab Http Server

## Run Docker
If you want to build container and to run server, you can exec this commands in root directory.
```
$docker build -t mecab-http-server .
$docker run -it -p 8080:8080 mecab-http-server
```
when you set up your container, you can open new terminal and access to http://localhost:8080/parse with curl command.
```
$curl -H 'Content-Type:application/json' -d '{"text": "<< YOUR TEXT >>"}' http://localhost:8080/parse
```

## Stop Docker
If you want to exit and to stop container, you can press Ctrl-C.

## Restart Docker
In first, you need to check the container id with this command.
```
$docker ps -a
```
Then you find mecab-http-server container's id.
Secondly, you can exec this commands to restart docker container.
```
$docker restart <<CONTAINER ID>>
$docker attach <<CONTAINER ID>>
```
