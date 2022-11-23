### загрузить файл 1.jpg на хост
```
curl -X POST \
    -H "Content-Type: multipart/form-data" \
    -F file=@1.jpg \
    http://localhost:8080/fileupload
```
    
### сгенерить псевдорандомную строку
```
openssl rand -base64 12
openssl rand -hex 12
```

### узнать процессы на определенном порту
```
lsof -i :8084
```

### выставить разрешения по умолчаню для ~/home директории
```
find . -type d -exec chmod 0755 {} \; 
find . -type f -exec chmod 0644 {} \; 
```
Более быстраа версия
```
find . -type d -print0 | xargs -0 chmod 755  
find . -type f -print0 | xargs -0 chmod 644 
```

для специфичного расширения файлов
```
find . -type f -name "*.php" -exec chmod 0640 {} \; 
```

### untar .tar.gz
```
tar -xvzf example.tar.gz
```

### extract .gz
```
gunzip -k file.gz
```
`-k` - option stays for the shorthand of `--keep` and keeps the file. Default command will delete archive while extracting
