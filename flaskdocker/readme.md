## Instructions for Dockerfile:
[article](https://codesolid.com/how-to-use-docker-with-python/).  

On lines 1-2, we’re specifying the base image that we discussed earlier, then upgrading pip as our first step. “RUN” statements get baked into the image as layers, and the target of the RUN command can be any command that’s valid on the base image.  

lines 5-7, we’re adding a user, setting that same user to be the default for any containers that launch, and setting WORKDIR to the user home. From this point on, the other commands in the file will execute in that directory.

Lines 9-10 copy the flaskapp.py and requirements.txt files that we showed earlier to the Docker image, and line 11 installs the requirements.txt file.

Lines 13-16 set up several environment variables to get us ready to run Flask. We set the PATH to refer to “flask” without typing the filename each time. The app name, FLASK_APP, must be set to the name of our Python module. We override the default port and set the FLASK_RUN_HOST to 0.0.0.0 to enable all connections. We need to do this to connect from outside the container, for example, from our host machine.  

## Build and Run

to build run this:  
```bash
docker build -t flask-example:latest .
```  
By default, docker build looks for a file named Dockerfile, so we don’t need to specify that explicitly. The part that reads "-t flask-example:latest” is tagging the image so we can refer to it when running a container based on it. Since when we run an image, Docker will pick “latest” as the version by default, we can generally just call it “flask-example” when we get to that point. Finally, the period sets the local Docker context to the current directory. This is the local directory that Docker uses on the host machine to build the image. It’s why, for example, our COPY commands in the Dockerfile didn’t need a full path.  

to run do this:  
```bash
docker run --name flask --rm -d -p 80:8080 flask-example:latest
```  

the image name appears at the end of the command, while the “--name flask” gives the running container a name. We can refer to the container by name this way, rather than having to remember the output, a long hexadecimal number representing the ID of the container. The “--rm” switch instructs Docker to remove the container once we’re done with it, making this command re-entrant. Remember, we still have the image, so we can run and remove the container as often as we wish. The next switch, “-p 80:8080“, maps our hosts port 80 to port 8080 in the container (8080 was the port we set in the Dockerfile for Flask to listen on). The -d runs the container in detached mode, meaning you won’t see Flask’s output, and you won’t be able to use CTRL-C to stop the container. Detached mode is often what you want, so you can continue to use the terminal for other tasks. However, running without it is sometimes preferable to see the CONSOLE output.  

we can open a browser and navigate to http://localhost to see that it worked  

if there is an error, this command shows some better resolutions:  
```bash
DOCKER_BUILDKIT=0  docker build .
```  
