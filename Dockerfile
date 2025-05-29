FROM python:3.12-slim

WORKDIR /app
COPY . .

RUN pip install uv
RUN uv sync

EXPOSE 8080

CMD uv run demo/ui/main.py --host=0.0.0.0 --port=${PORT:-8080}