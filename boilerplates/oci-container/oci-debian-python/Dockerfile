# python latest slim image
FROM python:3.12-slim-bookworm
LABEL maintainer="tomatoe-lib"

# working director in teh container
WORKDIR /app

# copy resources from local folder to container
COPY ./app.py /app/
COPY ./requirements.txt /app/

# install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# container listener
EXPOSE 8000

# execute the sript at containter startup
ENTRYPOINT ["python", "app.py"]