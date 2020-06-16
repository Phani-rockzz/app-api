FROM python:3.9.0b3-alpine3.12
#FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
COPY . /app/app
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000", "/app"]
