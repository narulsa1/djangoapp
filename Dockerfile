FROM python:3.7

RUN  mkdir -p  /opt/app/app
WORKDIR /opt/app
COPY requirements.txt /opt/app/
COPY app /opt/app/app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

RUN chown -R www-data:www-data /opt/app
CMD cd app && gunicorn app.wsgi --user www-data --bind 0.0.0.0:8000
