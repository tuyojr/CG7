# CG7

## Steps to Reproduce on A Linux O.S. with Docker Installed

1. Build the application image using a python base image.
2. Instal git and clone the [conduit project](https://github.com/danjac/realworld).
3. Build the image using `docker build -t image_name .`
4. Run the image inside a container and map it to the application port using `docker run -t -p 8000:8000 --name app -d image_name`
5. Get the container ID using `docker ps` Run the application migrations using `docker exec -it container_ID ./manage.py migrate`
6. Start the application server locally using `docker exec -it container_ID ./manage.py runserver`. 
7. If you're running this on the cloud, the steps are a bit different:
    - first, get into the container and edit the `ALLOWED HOSTS`. Use the command `docker exect -it container_ID sh`
    - while in the container, edit the `ALLOWED HOSTS` using `vi realworld/settings.py`, put the IP address of the server in quotes e.g. ['4.232.43.5'], save, quit, and exit the container.
    - next use `docker exec -it container_ID ./manage.py runserver 0.0.0.0:8080` to start the server
8. Test the provided link in your browser. It should look something like this `http://127.0.0.1:8000/`, for local testing. If you're using a cloud provider, replace the localhost IP with your server's IP.

> Dockerfile

```Dockerfile
# pull the python image as our base image
FROM python:3.10-alpine

# install git
RUN apk add git

# clone the project repository
RUN git clone https://github.com/danjac/realworld.git

# set the working directory to the project directory
WORKDIR /realworld

# create a virtual environment
RUN python -m venv venv

# activate the virtual environment
RUN source venv/bin/activate

# install the project dependencies
RUN pip install -r requirements.txt

# expose the port 8000
EXPOSE 8000
```