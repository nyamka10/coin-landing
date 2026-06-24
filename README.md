# Coin — лендинг

Простой лёгкий лендинг для приложения учёта расходов **Coin** (iOS / Android / веб).
Статика (HTML + CSS + немного JS), отдаётся через nginx в Docker-контейнере.

## Структура

```
index.html      разметка лендинга
styles.css      стили (дизайн в стиле Apple, адаптив под мобильные)
app.js          лёгкие анимации появления + навигация
nginx.conf      конфиг веб-сервера (gzip, кэш)
Dockerfile      сборка образа на nginx:alpine (~25 МБ)
docker-compose.yml  запуск с лимитами ресурсов
```

## Запуск через Docker Compose

```bash
docker compose up -d --build
```

Откройте → http://localhost:8080

Остановить:

```bash
docker compose down
```

## Запуск без Compose

```bash
docker build -t coin-landing .
docker run -d -p 8080:80 --name coin-landing coin-landing
```

## Локально без Docker

Просто откройте `index.html` в браузере — внешних зависимостей нет.

## Почему легко для системы

- Базовый образ `nginx:alpine` — минимальный размер.
- Чистая статика: нет Node, БД и бэкенда в рантайме.
- Лимиты в compose: 0.25 CPU и 64 МБ памяти.
- Включён gzip и кэширование статики.
```
