## Post
Сделать POST-запрос с параметрами
```
POST /session/new HTTP/1.1
Host: host.com
User-Agent: HTTPTool/1.1
Content-Type: application/x-www-form-urlencoded
Content-Length: 30

username=admin&password=secret
```

сделать почанковую распределенную загрузку
```
GET /stream HTTP/1.1
Host: host.com
```