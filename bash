# загрузить файл на хост
curl -X POST \
    -H "Content-Type: multipart/form-data" \
    -F file=@1.jpg \
    http://localhost:8080/fileupload
    
# сгенерить псердорандомную строку
openssl rand -base64 12
openssl rand -hex 12
