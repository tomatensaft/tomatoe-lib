FROM python:alpine

RUN apk update 
RUN apk add -y python-pip; pip install --no-cache-dir --upgrade pip
WORKDIR /hello-flask
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY /app .
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]