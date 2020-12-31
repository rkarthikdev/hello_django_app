FROM python:3.7-alpine3.7

# copy source and install dependencies
RUN  apk update && apk upgrade -y && apk install nano

WORKDIR /code

COPY . /code


RUN rm -rf deployment && pip install -r requirements.txt

# start server
EXPOSE 8010

#removing host binded to the port  
CMD gunicorn app.wsgi --user www-data --bind :8010 --workers 3 