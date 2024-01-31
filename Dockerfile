FROM python:3.11.5-slim-bookworm

RUN apt update \
    && apt install -y curl build-essential wget vim git ffmpeg

RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/etc/poetry python3 -

WORKDIR /code
COPY ./poetry.lock /code/
COPY ./pyproject.toml /code/

RUN /etc/poetry/bin/poetry install --no-interaction --no-ansi --no-root


