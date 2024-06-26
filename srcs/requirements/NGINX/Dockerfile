FROM alpine:3.20.1

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/* 
	
# Removes cached package lists to reduce the image size.

# Generate self-signed SSL certificate for testing
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/CN=localhost"

# Copy the custom NGINX configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 443 for HTTPS
EXPOSE 443

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
