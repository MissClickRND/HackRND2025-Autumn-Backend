# Приложение для управления проектами - Ростелеком
Проект реализованный на Осеннем хакатоне 2025

Другие репозитории:
- [Frontend](https://github.com/MissClickRND/HackRND2025-Autumn)
- [Backend](https://github.com/MissClickRND/HackRND2025-Autumn-Backend)
- [Mobile](https://github.com/bybuss/DGTU-2025-AUTUMN)

# Стек
- React + TS
- Motion
- MantineUI
- Zustand
---
- Nest.js
- PrismaORM
- PostgreSQL
---
- Kotlin
# Как развернуть

Копируете фронтенд репозиторий
```
npm i 
npm run dev
```
Создаете пустую папку с файлом docker-compose.yml, c содержанием 
```
services:
  postgres:
    image: rrailee/hack-db
    container_name: HackDB
    ports:
      - "5432:5432"

  backend:
    image: rrailee/hack-backend
    container_name: api
    ports:
      - "3000:3000"
    environment:
      DATABASE_URL: "postgresql://user:password@postgres:5432/test?schema=public"
    depends_on:
      - postgres
    restart: unless-stopped
```
потом
```
docker-compose up -d
```
Создасться докер контейнер, его запускаете и все будет рабоать
