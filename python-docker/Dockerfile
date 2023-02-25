# syntax=docker/dockerfile:1 # this line tells Docker to use the external rontend, a tool that can extend of modify the syntax and features of Docker  By using this directive, you can ensure that your Dockerfile uses the most current and compatible version of the syntax
# This is the base image
FROM python:3.8-slim-buster 

# instructs Docker to use this path as the default location for all subsequent commands
# By doing this, we do not have to type out full file paths but can use relative paths based on the working directory.
WORKDIR /app

# The first parameter tells Docker what file(s) you would like to copy into the image. 
# The second parameter tells Docker where you want that file(s) to be copied to.
COPY requirements.txt requirements.txt

# use the RUN command to execute the command pip3 install
RUN pip3 install -r requirements.txt

# add our source code into the image.
COPY . .

# Use CMD to tell Docker what command we want to run when our image is executed inside a container.
# need to make the application externally visible (i.e. from outside the container) by specifying --host=0.0.0.0.
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
