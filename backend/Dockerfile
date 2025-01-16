# Use the official Python image as the base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /backend

# Copy the app files into the container
COPY . .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV FLASK_APP=/backend/app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5001

# Expose the port the app runs on
EXPOSE 5001

# Run the Flask app
CMD ["flask", "run"]