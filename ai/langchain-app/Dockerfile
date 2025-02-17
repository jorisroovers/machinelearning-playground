# Use a Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install necessary dependencies
COPY pyproject.toml .
RUN pip install uvicorn fastapi langchain

# Copy the langchain app files into the Docker image
COPY . .

# Expose the port for the FastAPI server
EXPOSE 8000

# Set the entrypoint to run the FastAPI server using uvicorn
ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
