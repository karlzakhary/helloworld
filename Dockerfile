# Pull base image
FROM python:3.6-slim

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
#WORKDIR /code
#
## Install dependencies
#RUN pip install pipenv
#COPY Pipfile Pipfile.lock /code/
#RUN pipenv install --system
ADD . /usr/src/app
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
CMD exec gunicorn helloworld_project.wsgi:application --bind 0.0.0.0:8000 --workers 3
# Copy project
COPY . /code/
