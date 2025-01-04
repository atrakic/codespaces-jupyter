FROM jupyter/base-notebook:latest

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt
COPY . /app
