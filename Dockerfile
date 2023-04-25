FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN echo y | apt-get install locales
RUN echo y | apt install build-essential

    


RUN pip3 install setuptools wheel yarl multidict
COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN dpkg-reconfigure locales
COPY . /app

CMD ["python3", "bot.py"]
