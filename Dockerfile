FROM python:3.7
RUN apt-get update -y && apt-get install nginx -y 
COPY nginx.default /etc/nginx/sites-available/default

RUN  mkdir -p  /opt/app/app
WORKDIR /opt/app
COPY requirements.txt start-server.sh /opt/app/
COPY app /opt/app/app

# RUN python -m pip install --user --upgrade pip && python -m pip install --user virtualenv && python3 -m venv env 
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8020

RUN chown -R www-data:www-data /opt/app
STOPSIGNAL SIGTERM
CMD ["/opt/app/start-server.sh"]
