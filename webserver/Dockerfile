FROM nginx:1.26.3-bookworm

COPY ./src  /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf

# Cloud Run はポート 8080 を使用する
ENV PORT 8080

CMD ["nginx", "-g", "daemon off;"]
