FROM ubuntu

# Install wget, unzip, python2.7
RUN apt-get update \
  && apt-get install -y wget unzip python2.7 python-pil python-pip \
  && rm -rf /var/lib/apt/lists/*

# Install GAE
RUN wget -O /appengine.zip https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.38.zip
RUN unzip /appengine.zip -d /appengine && rm /appengine.zip


# Copy src files to /app
RUN mkdir /app
COPY . /app

# Install dependencies.
RUN cd /app && pip install -r requirements.txt -t lib

# Expose and start app server.
EXPOSE 22 8000 8080
ENTRYPOINT /appengine/google_appengine/dev_appserver.py \
  --skip_sdk_update_check --host 0.0.0.0 /app/

