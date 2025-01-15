# Use the official Python image as the base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /backend

COPY requirements.txt requirements.txt


RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5001

# Expose the port the app runs on
EXPOSE 5000

# Run the Flask app
CMD ["flask", "run"]