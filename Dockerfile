FROM python:3.12-slim

WORKDIR /app
COPY . .

RUN pip install uv
RUN uv sync

EXPOSE 8080

ENV A2A_UI_HOST=0.0.0.0
ENV A2A_UI_PORT=8080

CMD ["uv", "run", "demo/ui/main.py"]