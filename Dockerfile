# Pull base image
FROM python:slim-bullseye

# Create user
RUN addgroup --system appgroup && adduser --system --group appuser

# Set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /code

# Updates and installation of requirements
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY --chown=appuser:appgroup requirements.txt /code/
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy project
COPY --chown=appuser:appgroup . /code/

# Ensure executability of entrypoint shell script
RUN chmod +x /code/entrypoint.sh

# Switch to the app user
USER appuser

# Run entrypoint.sh (Assumes it starts gunicorn or another WSGI server)
ENTRYPOINT ["/bin/sh", "/code/entrypoint.sh"]
