FROM python
WORKDIR /src
COPY . .
RUN pip install -r requirement.txt
EXPOSE 5000
CMD python app.py
