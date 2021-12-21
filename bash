# загрузить файл 1.jpg на хост
curl -X POST \
    -H "Content-Type: multipart/form-data" \
    -F file=@1.jpg \
    http://localhost:8080/fileupload
    
# сгенерить псевдорандомную строку
openssl rand -base64 12
openssl rand -hex 12

# узнать процессы на определенном порту
lsof -i :8084
