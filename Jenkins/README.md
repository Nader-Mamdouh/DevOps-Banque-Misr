# Jenkins Pipelines

This repository contains Jenkins pipelines for different parts of the application and infrastructure management process. The pipelines utilize a shared library from the following repository: [Jenkins Shared Library](https://github.com/Macarious-GK/Jenkins-Shared-Library.git).

## Folder Structure

The Jenkins folder consists of the following pipelines:

1. **app_pipeline_creation**: Pipeline responsible for building, testing, and deploying the application.
2. **Remove_Deployment**: Pipeline responsible for tearing down or removing the deployment from the environment.
3. **Infra_structure Pipeline**: It is responsible for both **applying** and **destroying** infrastructure resources by using **Build with Parameters** action: (apply or destroy)

## Jenkins Shared Library

The pipelines in this repository make use of a shared library to promote reusable and modular pipeline steps. The shared library is hosted in the following GitHub repository: [Jenkins Shared Library](https://github.com/Macarious-GK/Jenkins-Shared-Library.git).

To use the shared library in your Jenkins pipeline, add the following configuration to your `Jenkinsfile`:

```groovy
@Library('Jenkins-Shared-Library') _
// Pipeline Code
```

## Credential Management
- **Credentials Storage**: Use Jenkins’ credentials management to securely store sensitive information like API keys and passwords.
- **Environment Variables**: Access credentials via environment variables configured in Jenkins.

## Security Authorization
- **Mixed Security Authorization**: Segment access permissions based on roles and responsibilities.
- **Least Privilege Principle**: Ensure users and services have only the permissions needed for their tasks.

## How to Run the Pipelines
1. Configure Jenkins Shared Library under **Manage Jenkins** -> **Configure System** -> **Global Pipeline Libraries**.
2. Update your `Jenkinsfile` to use the shared library.
3. Trigger pipelines through Jenkins UI or set automated SCM-based triggers.