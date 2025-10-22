# backend/Dockerfile

# Используем Alpine (но можно и node:18, если не хочешь проблем)
FROM node:18-alpine

# Обязательно: добавляем совместимость с libc для Prisma
RUN apk add --no-cache libc6-compat

WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем ВСЕ зависимости (включая dev — нужен prisma CLI)
RUN npm ci

# Копируем исходный код
COPY . .

# Собираем TypeScript
RUN npm run build

# Генерируем Prisma Client ВНУТРИ контейнера (под Alpine!)
RUN npx prisma generate

# Открываем порт
EXPOSE 3000

# Запускаем production-версию
CMD ["npm", "run", "start:prod"]