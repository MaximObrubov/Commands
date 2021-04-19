# загрузить файл на хост
curl -X POST \
    -H "Content-Type: multipart/form-data" \
    -F file=@1.jpg \
    http://localhost:8080/fileupload
