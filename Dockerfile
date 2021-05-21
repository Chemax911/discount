FROM python:3 as django
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt


FROM node:12 as node
RUN mkdir /app
COPY frontend/angular/package.json /app
WORKDIR /app
RUN npm install
RUN npm install -g @angular/cli