FROM ubuntu:19.04
LABEL maintainer="Bryan Flood <bryanfloodcontact@gmail.com>"
LABEL description="🐳🌎GeoDjango Docker for Heroku Deployments"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG 1

RUN apt-get update -qq && \
    apt-get upgrade -qq && \
    apt-get install -qq build-essential     \
                        python3.6           \
                        wget                \
                        unzip               \
                        python3-pip      && \
    pip3 install        django              \
                        django-leaflet      \
                        gunicorn            \
                        whitenoise          \
                        django-pwa          \
                        psycopg2-binary  && \
    apt-get install     libpq-dev           \
                        binutils            \
                        libproj-dev         \
                        gdal-bin -qq

COPY . .

CMD gunicorn <your-project_name>.wsgi:application --bind 0.0.0.0:$PORT