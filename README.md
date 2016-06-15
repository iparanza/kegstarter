Kegstarter
==========

Kegstarter

Developer Setup
===============
The developer setup is assuming Ubuntu Server 14.04 as a starting point.

  1. Install pip
  `sudo apt-get install python-pip`

  2. Download and install the Google Apps SDK (currently 1.9.4) from
  [https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_Python](https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_Python)

  3. Install dependencies:
  `pip install -r requirements.txt -t lib`

  4. Start the project with
  `$ /path/to/app_engine/dev_appserver.py --host 0.0.0.0 kegstarter/`

Or You can create a Docker container to run the app. It will install deps and
start the app server at http://localhost:8080
```
$ docker build -t kegstarter <path_to_src>
$ docker run -d kegstarter
```

To stop the container, find the container name or id using `docker ps` and
gracefully stop the server using `docker stop <name|id>`.


