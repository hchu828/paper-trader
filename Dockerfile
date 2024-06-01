# Stage 1: Build stage
FROM python:3.9.18-slim as builder

ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Install npm and Python dependencies
RUN apt-get update && \
    apt-get install -y npm


COPY ./requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY . .

# Build static files
WORKDIR /app/theme/static_src
RUN npm run build && \
    npx update-browserslist-db@latest

# Stage 2: Production stage
FROM python:3.9.18-slim

ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Copy Python dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy the application code
COPY --from=builder /app .

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose port
EXPOSE 8000