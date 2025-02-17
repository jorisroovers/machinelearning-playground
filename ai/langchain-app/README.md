# Langchain ChatGPT-like App

This is a simple langchain app in Python with a chatGPT-like web interface using uv for project and dependency management and VueJS for the front-end UI.

## Prerequisites

- Docker
- Docker Compose

## Building the Docker Image

To build the Docker image for the langchain app, run the following command:

```sh
docker build -t langchain-app .
```

## Running the Docker Container

To run the Docker container and expose the port to your local machine, run the following command:

```sh
docker run -p 8000:8000 langchain-app
```

## Accessing the ChatGPT-like Web Interface

Once the Docker container is running, you can access the chatGPT-like web interface by opening your web browser and navigating to:

```
http://localhost:8000
```

You should see the chat interface where you can type your messages and receive responses from the langchain app.
