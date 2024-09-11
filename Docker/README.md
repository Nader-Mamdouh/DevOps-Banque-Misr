# Building and Running the Docker Image

## Build the Docker Image

To build the Docker image using either of the Dockerfiles, run the following commands:


### Using `Dockerfile (multi-stage)`
```bash
docker build -t image_name:tag -f Dockerfile .
```
### Run the Container
To run the container and expose the application on port 8000, use the following command:
```bash
docker run -p 8000:8000 image_name:tag
```
This will make the application accessible at localhost Port --> 8000.
