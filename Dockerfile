FROM python:3.12-slim

WORKDIR /app
COPY . .

RUN if [ -f "requirements.txt" ]; then pip install -r requirements.txt; \
    elif [ -f "pyproject.toml" ]; then pip install uv && uv sync; \
    else pip install mesop httpx; fi

EXPOSE 8080

# Cloud Run sets PORT environment variable
ENV HOST=0.0.0.0

CMD ["python", "-m", "mesop.cli.main", "demo/ui/main.py", "--host=0.0.0.0", "--port=${PORT:-8080}"]