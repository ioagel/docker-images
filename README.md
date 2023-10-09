# README

## Nginx alpine container with health endpoint

Adds a health check endpoint to default config

```nginx
location /healthz {
    access_log off;

    if ($request_method = OPTIONS ) {
        add_header Content-Length 0;
        add_header Content-Type text/plain;
        return 200;
    }

    add_header 'Content-Type' 'application/json';
    return 200 '{"status":"UP"}';
}
```

Use `/healthz` endpoint with either a GET or an OPTIONS request

```shell
docker pull ioagel/nginx-healthz:1.25-alpine
```

## Mysql container with minio client for backups/restores

```shell
docker pull ioagel/mysql-minio:8.1
```
