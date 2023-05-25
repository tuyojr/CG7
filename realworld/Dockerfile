# pull the python image as our base image
FROM python:3.10-alpine
LABEL maintainer="tuyojr olutuyod@gmail.com"

# copy project files to the working directory
COPY . /realworld

# set the working directory
WORKDIR /realworld

# create a virtual environment
RUN python -m venv venv

# activate the virtual environment
RUN /bin/sh -c "source venv/bin/activate"

# install libmysqlclient-dev
RUN apk add --no-cache mariadb-connector-c-dev

# upgrade pip
RUN pip install --upgrade pip

# install the project dependencies
RUN pip install -r requirements.txt

# expose the port 8000
EXPOSE 8000

# Give execute permissions to the entrypoint script
RUN chmod +x /realworld/entrypoint.sh

# Create entrypoint for the application
ENTRYPOINT ["/realworld/entrypoint.sh"]
