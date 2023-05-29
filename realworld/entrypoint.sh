#!/bin/sh
source venv/bin/activate
export PYTHONPATH=$PYTHONPATH:$(pwd)
pip install -r requirements.txt
SECRET_KEY=$(python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())")
python manage.py makemigrations accounts
python manage.py makemigrations articles
python manage.py makemigrations comments
./manage.py migrate
./manage.py runserver 0.0.0.0:8000
