#!/bin/bash
echo "----------------------------------------"
echo "Waiting for MySQL initialization - 30 sec"
echo "----------------------------------------"
sleep 30

cd code/

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
echo "Create django superuser"
echo "----------------------------------------"

if [ "$DJANGO_SUPERUSER_USERNAME" ]
then
  python manage.py createsuperuser \
          --noinput \
          --email $DJANGO_SUPERUSER_EMAIL \
          --first_name $DJANGO_SUPERUSER_USERNAME
fi

echo "----------------------------------------"
echo "Start server"
echo "----------------------------------------"
python manage.py runserver 0.0.0.0:8000
