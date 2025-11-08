# Use Python 3.12 slim image as base
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    FLASK_APP=run.py \
    FLASK_ENV=production

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Create requirements-docker.txt with compatible versions
RUN echo "Flask==2.2.2" > requirements-docker.txt && \
    echo "Werkzeug==2.2.3" >> requirements-docker.txt

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements-docker.txt

# Copy application code
COPY app/ ./app/
COPY run.py .

# Expose port
EXPOSE 5000

# Run the application
ENTRYPOINT ["python3", "run.py"]