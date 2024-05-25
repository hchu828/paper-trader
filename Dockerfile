# Pull base image
FROM python:3.9.18-slim

# Set environmental variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install npm
RUN apt-get update
RUN apt-get install -y npm

# Install Python dependencies
COPY ./requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project
COPY . .

# Install Tailwind dependencies
WORKDIR /app/theme/static_src
RUN npm install
RUN npm run build

# Collect static files
WORKDIR /app
RUN python manage.py collectstatic --noinput

# Expose port
EXPOSE 8000