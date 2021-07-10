FROM python:2.7
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt
COPY . /usr/src/app
ENV PORT 80
EXPOSE $PORT

VOLUME["/app-data"]
cmd gunicorn -b : -c gunicorn.conf.py main:app
