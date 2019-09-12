# Angular12FactorConfig

# An example of how to use Angular and Docker to follow The 12 Factor App config guidelines.

## Run with Docker
* `docker build -t angular-12-factor-config .`
* `docker run -e WELCOME_MESSAGE='Welcome to 12 Factor' --publish 8080:80  angular-12-factor-config:latest`
* navigate to `http://localhost:8080/`

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 8.0.3.
