# JWT sign token generator

Для работы вам понадобятся:
- `JWT_SECRET` - приватный ключ ресурса, обязательный параметр
- `payload` - путь к JSON-файлу данных, которые вы хотите поместить в токен,
              если не передан, то будет использоваться пустой объект `{}`

Команда для генерации JWT токена:
`JWT_SECRET=XXX payload=payload.json ./sign_jwt.sh`

Добавляет стандартные поля для `header'а` JWT:
```
{
  "typ": "JWT",
  "alg": "HS256",
  "kid": "0001",
  "iss": "Bash JWT Generator",
  "iat": 1618922372
}
```
