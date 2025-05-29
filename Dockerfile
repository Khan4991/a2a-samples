FROM python:3.12-slim

WORKDIR /app
COPY . .

RUN pip install uv
WORKDIR /app/demo/ui
RUN uv sync

EXPOSE 8080

CMD ["uv", "run", "main.py"]