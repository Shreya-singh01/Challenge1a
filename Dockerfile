# Minimal Dockerfile 
#
Usage after cloning:
  docker build -t Challenge1a .
  docker run --rm -v "$PWD:/app" Challenge1a <input.pdf> <model.joblib> <output.json>
#
# Example:
#   docker run --rm -v "$PWD:/app" Challenge1a sample.pdf tfidf_heading_classifier.joblib result.json

FROM python:3.10

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY parse_pdf_and_classify.py .
COPY tfidf_heading_classifier.joblib .

ENTRYPOINT ["python", "parse_pdf_and_classify.py"]
CMD [] 