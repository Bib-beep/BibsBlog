FROM ghcr.io/gohugoio/hugo:v0.159.0 AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html