FROM python:3.12-slim

WORKDIR /app
COPY . .

# Install dependencies based on what's available
RUN if [ -f "requirements.txt" ]; then pip install -r requirements.txt; \
    elif [ -f "pyproject.toml" ]; then pip install uv && uv sync; \
    else pip install mesop httpx; fi

EXPOSE 8080

ENV A2A_UI_HOST=0.0.0.0
ENV A2A_UI_PORT=8080

CMD ["python", "demo/ui/main.py"]