FROM python:3.10.7-slim-bullseye

# switch working directory
WORKDIR /app

# Installing requirements
COPY pyproject.toml /app/
COPY poetry.lock /app/
COPY setup.cfg /app/
COPY README.md /app/

# File imports : source code
COPY ./labonneboite_common /app/labonneboite_common
RUN pip install poetry \ 
    && poetry install

WORKDIR /app/labonneboite_common

COPY ./docker/v3.10/entrypoints ./entrypoints

