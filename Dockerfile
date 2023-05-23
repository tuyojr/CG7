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