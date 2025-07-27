FROM --platform=linux/amd64 python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the main script and model
COPY parse_pdf_and_classify.py .
COPY tfidf_heading_classifier.joblib .

# Create input and output directories
RUN mkdir -p /app/input /app/output

# Set the entry point
ENTRYPOINT ["python", "parse_pdf_and_classify.py"] 