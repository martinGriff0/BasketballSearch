FROM python:3.9-slim

ENV PYTHONUNBUFFERED 1 
EXPOSE 8000
WORKDIR /app
# Copy requirements from host, to docker container in /app 
COPY ./requirements.txt .
# Copy everything from ./src directory to /app in the container
COPY ./src .
RUN pip install -r requirements.txt
# Run the application in the port 8000
CMD ["uvocorn", "src.main:app", "--host=0.0.0.0"]