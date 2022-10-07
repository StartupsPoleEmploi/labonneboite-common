FROM python:3.10.7-slim-bullseye

# File imports : source code
COPY . .
RUN pip install poetry \ 
    && poetry install

WORKDIR /labonneboite_common

COPY ./docker/v3.10/entrypoints ./entrypoints

