# Building and Running the Docker Image

## Build the Docker Image

To build the Docker image using either of the Dockerfiles, run the following commands:

### Using `Dockerfile`

```bash
docker build -t my-python-app -f Dockerfile .
```
### Using Dockerfile_copy(multi-stage)
```bash
docker build -t my-python-app -f Dockerfile_copy .
```
### Run the Container
To run the container and expose the application on port 8000, use the following command:
```bash
docker run -p 8000:8000 my-python-app
```
This will make the application accessible at http://localhost:8000.
