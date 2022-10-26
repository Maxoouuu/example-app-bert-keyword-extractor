FROM python:3.9-slim

EXPOSE 3000

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Maxoouuu/example-app-bert-keyword-extractor.git .

RUN pip3 install -r requirements.txt

ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=3000", "--server.address=0.0.0.0"]