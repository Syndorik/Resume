FROM python:3
RUN mkdir ./data
COPY ./file1.html ./data/file1.html
COPY ./file2.html ./data/file2.html
COPY ./file3.html ./data/file3.html
WORKDIR ./data
EXPOSE 8080:8080
CMD ["python3","-m","http.server","8080"]
