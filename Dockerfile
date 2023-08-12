# Use the official Python base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Install pipenv
RUN pip install pipenv

# Set environment variable to use the virtual environment in the project
ENV PIPENV_VENV_IN_PROJECT=1

# Copy only Pipfile and Pipfile.lock first to leverage Docker cache
COPY Pipfile Pipfile.lock ./
RUN pipenv sync --system

# Copy the rest of your application
COPY . .

# Expose the port on which the application will run
EXPOSE 8080

# Run the FastAPI application using uvicorn server
CMD ["uvicorn", "webapp.main:app", "--host", "0.0.0.0", "--port", "8080"]
