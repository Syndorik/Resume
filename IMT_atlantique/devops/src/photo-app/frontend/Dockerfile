FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN apk upgrade --update
RUN pip install -r requirements.txt
EXPOSE 8017
ENTRYPOINT ["python"]
CMD ["hello.py"]
