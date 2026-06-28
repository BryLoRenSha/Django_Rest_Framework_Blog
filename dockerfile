FROM python:3.14.4

#install SSH client
RUN apt-get update && apt-get install -y openssh-client

#set enviroment variables
ENV PYTHONUNBUFFERED 1

#set the working directory
WORKDIR /app

#copy requirements
COPY requirements.txt /app/requirements.txt

#install python dependecies
RUN pip install -r requirements.txt

#copy the application to the working directory
COPY . /app

#Satrt the ssh tunel
CMD python manage.py runserver 0.0.0.0:8000