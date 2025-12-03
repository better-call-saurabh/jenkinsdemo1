FROM python:3.10-slim
WORKDIR /src
COPY . .
EXPOSE 4000
RUN pip install -r req.txt 
CMD ["python", "server.py"]
