FROM python:3.12-slim

WORKDIR /app
COPY . .

# Install dependencies explicitly
RUN pip install --no-cache-dir httpx mesop uvicorn fastapi python-dotenv

# Install local package
RUN pip install -e .

EXPOSE 8080

CMD ["python", "-u", "demo/ui/main.py"]