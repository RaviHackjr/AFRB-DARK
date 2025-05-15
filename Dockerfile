# Use Python 3.12 slim as the base image
FROM python:3.12-slim

# Set environment variables to reduce Python's memory footprint
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies including ffmpeg
RUN apt update && apt install -y \
    ffmpeg \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    git \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy application code
COPY . .

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Define the default command
CMD ["python", "bot.py"]
