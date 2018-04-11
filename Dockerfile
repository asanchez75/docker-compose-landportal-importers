FROM python:2

MAINTAINER Adam Sanchez <a.sanchez75@gmail.com>

RUN apt-get update && apt-get install -y libxml2-utils python-pip git

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
RUN rm -Rf /usr/src/app
RUN git clone --branch master https://github.com/landportal/landbook-importers.git /usr/src/app
RUN git clone --branch master https://github.com/landportal/landbook-receiver.git /usr/landbook-receiver

COPY init.sh /
RUN chmod u+x /init.sh

WORKDIR /usr/src/app

CMD ["/init.sh"]

