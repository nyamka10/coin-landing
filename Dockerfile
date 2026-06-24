# Лёгкий образ на базе nginx alpine (~25 МБ, почти не потребляет ресурсов)
FROM nginx:1.27-alpine

# Конфиг сервера
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Статические файлы лендинга
COPY index.html styles.css app.js /usr/share/nginx/html/

EXPOSE 80

# Простой healthcheck
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://localhost/ >/dev/null 2>&1 || exit 1
