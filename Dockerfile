FROM python:3.9.0b3-alpine3.12
#FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

COPY . /app/app
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000",]
