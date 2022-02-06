#!/bin/bash
echo "----------------------------------------"
echo "Waiting for MySQL initialization - 30 sec"
echo "----------------------------------------"
sleep 30

cd code/

# Make migrations
echo "----------------------------------------"
echo "Make migrations"
echo "----------------------------------------"
python manage.py makemigrations
python manage.py migrate
echo "----------------------------------------"
echo "Make index rebuilding"
echo "----------------------------------------"
python manage.py rebuild_index --noinput
echo "----------------------------------------"
echo "Start server"
echo "----------------------------------------"
python manage.py runserver 0.0.0.0:8000

# python manage.py createsuperuser --database world
