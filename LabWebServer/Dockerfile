FROM alpine:latest AS alp
ADD https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip /opt
WORKDIR /opt
RUN apk add unzip && unzip -q main.zip 

FROM nginx
COPY --from=alp /opt/linux-site-dio-main/ /usr/share/nginx/html/