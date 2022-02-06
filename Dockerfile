FROM python:3.7

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /web_app

WORKDIR /web_app

COPY ./code/requirements.txt .

RUN python3 -m pip install --upgrade pip

RUN python3 -m venv envs && . envs/bin/activate

RUN pip install --no-cache -r requirements.txt \
    && apt-get -y autoclean \
    && apt-get -y autoremove

EXPOSE 8000

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
