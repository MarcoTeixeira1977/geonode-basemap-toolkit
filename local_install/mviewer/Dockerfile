FROM nginx:alpine
COPY geonode.local.conf /etc/nginx/conf.d/geonode.local.conf

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash git openssh

RUN git clone https://github.com/geobretagne/mviewer.git /usr/share/nginx/html --quiet \ 
    && chown -R www:www /usr/share/nginx/html \
    && nginx -t \
    && rc-update add nginx default

EXPOSE 80
ENTRYPOINT ["nginx","-g","daemon off;"]