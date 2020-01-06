FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN ls
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
