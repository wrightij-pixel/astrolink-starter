FROM python:3.11-slim

WORKDIR /app

RUN addgroup --system app && adduser --system --ingroup app app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt psycopg2-binary==2.9.11

COPY --chown=app:app . .

USER app

EXPOSE 8000

CMD ["python", "run.py"]
