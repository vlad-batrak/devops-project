#!/bin/bash

if [ "$DJANGO_SUPERUSER_USERNAME" ]
then
  python code/manage.py createsuperuser \
          --email $DJANGO_SUPERUSER_EMAIL \
          --first_name $DJANGO_SUPERUSER_USERNAME
fi

$@
