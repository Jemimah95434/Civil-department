# Use official NGINX image
FROM nginx:alpine

# Copy static website files (index.html, etc.)
COPY . /usr/share/nginx/html

# Inject NGINX reverse proxy config directly
RUN echo 'server {\n\
    listen 80;\n\
    server_name civil.karunya;\n\
\n\
    location / {\n\
        proxy_pass http://host.docker.internal:3000;\n\
        proxy_http_version 1.1;\n\
        proxy_set_header Upgrade \$http_upgrade;\n\
        proxy_set_header Connection "upgrade";\n\
        proxy_set_header Host \$host;\n\
        proxy_cache_bypass \$http_upgrade;\n\
    }\n\
}' > /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Run NGINX
CMD ["nginx", "-g", "daemon off;"]


