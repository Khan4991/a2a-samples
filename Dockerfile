FROM python:3.12-slim

WORKDIR /app
COPY . .

# Install uv
RUN pip install uv

EXPOSE 8080

CMD ["uv", "run", "demo/ui/main.py"]