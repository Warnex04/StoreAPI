# StoreAPI Project

The StoreAPI project is a simple RESTful API that allows you to perform GET and POST operations on a collection of products. This project demonstrates how to create a .NET web API, use Redis as a cache, and containerize the application using Docker.

## Prerequisites

- Docker installed on your machine.
- Docker Compose installed on your machine.
- An account on Docker Hub (if you want to push/pull images).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

# Windows Instructions:

1. **Download the docker-compose.yml file:**
   Download the `docker-compose.yml` file from the GitHub repository to a directory on your machine.

2. **Run Docker Compose:**
   Open PowerShell, navigate to the directory containing the `docker-compose.yml` file using the `cd` command. Once in the directory, run the following command to pull the Docker image and start the Docker containers:
   ```powershell
   docker-compose --env-file .\env_file.env up

### Testing the API:

In powershell :

- **POST Request:**
  ```powershell
  Invoke-RestMethod -Method Post -Uri 'http://localhost:5000/api/products' -Headers @{ 'Accept' = 'application/json'; 'Content-Type' = 'application/json' } -Body '{"name": "<product name>","price": <product price>,"quantity": <product quantity>}'
  ```

- **GET Request:**
  ```powershell
  Invoke-RestMethod -Method Get -Uri 'http://localhost:5000/api/products' -Headers @{ 'Accept' = 'application/json' }
  ```

- **Stopping the Containers:**
  ```powershell
  docker-compose --env-file .\env_file.env down
  ```


# Linux Instructions:

## Step 1: Download the docker-compose.yml file
Download the docker-compose.yml file from the GitHub repository to a directory on your machine.

## Step 2: Run Docker Compose
Open a terminal, navigate to the directory containing the docker-compose.yml file using the `cd` command. Once in the directory, run the following command to pull the Docker image and start the Docker containers:
```bash
docker-compose --env-file .\env_file.env up
```

In Bash :

- **POST Request:**
  ```Bash
  curl -X POST "http://localhost:5000/api/products" -H "Content-Type: application/json" -d '{"name": "<product name>", "price": <product price>, "quantity": <product quantity>}'
  ```

- **GET Request:**
  ```Bash
  curl "http://localhost:5000/api/products"
  ```
  
- **Stopping the Containers:**
  ```Bash
  docker-compose --env-file .\env_file.env down
  ```


# Notes:

The port 5000 is specified in the docker-compose.yml file and is mapped to port 80 in the Docker container. If you wish to use a different port on your host machine, you can change the 5000 to your desired port number in the docker-compose.yml file.
The Redis data is persisted across container restarts using a Docker volume. This volume is defined in the docker-compose.yml file under the volumes section.
