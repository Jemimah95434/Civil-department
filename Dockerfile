# Use official Nginx image to serve static files
FROM nginx:alpine

# Copy current folder contents into Nginx html folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]

