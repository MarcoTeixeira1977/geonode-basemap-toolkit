FROM alpine:latest

RUN apk add --no-cache \
	git \
	gcc \
	bash \
    sed \
	openssh \
	musl-dev  \
	python3 \
	python3-dev \
	libxml2-dev  \
	libxslt-dev \
	linux-headers \
    libc-dev \
    geos-dev

RUN git clone https://github.com/geopython/pywps-demo.git
 
WORKDIR /pywps-demo
RUN pip3 install --upgrade pip \
    && sed -i '/pyproj/d' ./requirements.txt \
    && pip3 install -r requirements.txt \
    && pip3 install --nobinary pyproj
 
EXPOSE 5000 
ENTRYPOINT ["/usr/bin/python3", "demo.py","-a"]

#docker build -t pywps-demo . 
#docker run -p 5000:5000 pywps-demo
#http://localhost:5000/wps?request=GetCapabilities&service=WPS
#http://localhost:5000/wps?request=DescribeProcess&service=WPS&identifier=all&version=1.0.0