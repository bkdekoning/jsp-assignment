#!/bin/sh

# Determine if running in development or production
if [ "$DJANGO_LOCAL" = "True" ]; then
    # Start Django's runserver for local development
    exec python manage.py runserver 0.0.0.0:8000
else
    # Run Django management commands
    python manage.py migrate --noinput
    python manage.py collectstatic --noinput

    python manage.py createsuperuser \
        --noinput \
        --username "$DJANGO_SUPERUSER_USERNAME" \
        --email "$DJANGO_SUPERUSER_EMAIL"


        # Start gunicorn for production
        exec gunicorn django_project.wsgi:application --bind 0.0.0.0:8080
fi