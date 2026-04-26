# Start first build stage with the latest Hugo image.
FROM ghcr.io/gohugoio/hugo:latest AS builder

# Sets working directory inside the container to /src.
# Any following COPY, RUN, ... commands will be executed in this directory.
WORKDIR /src

# Copy everything from your project's directory on your machine into /src inside the container
COPY . .

# Runs Hugo inside the container to build the site.
RUN hugo

# Start second build stage with the latest nginx image on Alpine Linux.
FROM nginx:latest

# Copy the built static site from the builder stage into Nginx's default public directory.
COPY --from=builder /src/public /usr/share/nginx/html

# Container listens on port 80.
EXPOSE 80

# Start Nginx in the foreground (without daemonizing) to keep the container running.
CMD ["nginx", "-g", "daemon off;"]