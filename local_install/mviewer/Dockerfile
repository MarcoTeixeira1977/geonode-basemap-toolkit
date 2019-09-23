FROM nginx:alpine
COPY ./hosts /etc/hosts
COPY geonode.local.conf /etc/nginx/conf.d/geonode.local.conf

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash git openssh

RUN mkdir /usr/share/nginx/mviwer \
    && git clone https://github.com/geobretagne/mviewer.git /usr/share/nginx/mviewer --quiet \ 
    && chown -R www:www /usr/share/nginx/mviewer \
    && nginx -t \
    && rc-update add nginx default

EXPOSE 80
ENTRYPOINT ["nginx","-g","daemon off;"]