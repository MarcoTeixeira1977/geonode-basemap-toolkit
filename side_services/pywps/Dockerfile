FROM pywps/gunicorn-alpine:3.6

COPY hosts /etc/hosts

RUN pip3 install --upgrade pip \
    && apk update \ 
    && apk add libpq \
    && apk add --virtual .build-deps gcc python-dev musl-dev postgresql-dev \
    && pip3 install psycopg2 \
    && apk del .build-deps
