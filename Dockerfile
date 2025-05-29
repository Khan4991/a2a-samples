FROM python:3.12-slim

WORKDIR /app
COPY . .

RUN pip install uv

# Install UI dependencies
WORKDIR /app/demo/ui
RUN uv sync

# Install agent dependencies  
WORKDIR /app/samples/python/agents/langgraph
RUN uv sync

# Create startup script
WORKDIR /app
RUN echo '#!/bin/bash\n\
cd /app/samples/python/agents/langgraph && uv run . &\n\
cd /app/demo/ui && uv run main.py\n\
' > start.sh && chmod +x start.sh

EXPOSE 8080

CMD ["./start.sh"]