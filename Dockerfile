# Use uv python 3.13

FROM ghcr.io/astral-sh/uv:python3.13-alpine

WORKDIR /app

COPY app.py pyproject.toml ./

RUN uv sync

EXPOSE 8501

CMD [ "uv", "run", "streamlit", "run", "app.py" ]