FROM nginx:alpine

# Copy all your static website files
COPY . /usr/share/nginx/html/

# Add clean nginx config
RUN cat <<EOF > /etc/nginx/conf.d/default.conf
server {
    listen 80;
    server_name lvh.me;

    root /usr/share/nginx/html;
    index index.html index.htm;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

