FROM python:3.12-slim

WORKDIR /app
COPY . .

# Install dependencies - httpx is missing
RUN pip install mesop httpx

EXPOSE 8080

CMD ["python", "demo/ui/main.py"]