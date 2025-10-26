# Use the official Nginx image to serve static content
FROM nginx:alpine

# Copy your static files into Nginx's default public directory
COPY . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Nginx automatically starts as the container's main process

