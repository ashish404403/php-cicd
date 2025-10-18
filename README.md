# PHP CI/CD with GitHub Actions and Docker Hub

This repository contains a "Hello World" PHP application with a CI/CD pipeline using GitHub Actions to automate building and publishing a Docker image.

## How it Works

The CI/CD pipeline is triggered automatically when a new **release** is published on GitHub.

1.  **Trigger**: A new GitHub release starts the workflow.
2.  **Checkout Code**: The workflow checks out the source code corresponding to the release tag.
3.  **Build & Push Docker Image**: It builds a multi-platform (`linux/amd64`, `linux/arm64`) Docker image for the application.
4.  **Publish to Docker Hub**: The image is pushed to Docker Hub with two tags: `latest` and the release version (e.g., `v1.0.0`).

## How to Run Locally

You can run the application locally using Docker Compose:

```bash
docker compose up
```

The application will be available at `http://localhost:8080`.

## Required GitHub Secrets

To use this CI/CD pipeline in your own repository, you need to configure the following secrets in `Settings > Secrets and variables > Actions`:

*   `DOCKERHUB_USERNAME`: Your Docker Hub username.
*   `DOCKERHUB_TOKEN`: Your Docker Hub access token for logging in and pushing the image.
*   `MYGITHUB_TOKEN`: A GitHub Personal Access Token (PAT) with `repo` scope. This is required for the checkout action to access the repository content for the release tag.

## Workflow Variables

The workflow uses the following variable provided by GitHub Actions:

*   `github.event.release.tag_name`: This contains the tag of the release that triggered the workflow (e.g., `v1.0.1`) and is used to tag the Docker image.

---

This setup provides a robust pipeline for automatically building and deploying your PHP application upon new releases.
