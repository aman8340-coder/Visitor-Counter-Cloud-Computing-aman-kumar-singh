FROM python:3.12-alpine AS builder
WORKDIR /build
COPY app/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.12-alpine
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1
WORKDIR /app
COPY --from=builder /install /usr/local
COPY app/app.py .
COPY app/templates ./templates
COPY app/static ./static
RUN adduser -D -u 10001 appuser
USER 10001
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "app:app"]
