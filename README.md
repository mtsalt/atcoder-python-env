# atcoder-python-env
A Dockerized Python environment for running AtCoder problems locally. Includes pre-configured dependencies and tools for seamless local testing.

## Prerequisites
1. Docker
    - Docker (**version 20.10 or higher**) must be installed and running on your system. Follow the [official Docker installation guide](https://docs.docker.com/get-docker/) to install Docker.
1. Custom template
    - If you want to use atcoder-tools' default template, update `.atcodertools.toml` as follows:
    ``` toml
    [codestyle]
    lang = 'python'
    #template_file='~/my_template.py'
    workspace_dir='~/atcoder-workspace/'
    ```
    > Comment out the line `template_file='~/my_template.py'` if you do not wish to use a custom template.
## Installation
1. Clone this repository 
    ``` bash
    git clone https://github.com/mtsalt/atcoder-python-env.git
    ```
1. Change directory to `atcoder-python-env`
    ``` bash
    cd atcoder-python-env
    ```
1. docker build 
    ``` bash
    docker image build --build-arg USER_ID=$(id -u) --build-arg USER_GROUP=$(id -g) -t atcoder-env . 
    ```

## Usage
1. Change directory to the desired directory
    ``` bash
    cd [your desired directory]
    ```
1. Run the Docker container
    ``` bash
    docker run -it -v ./:/home/envuser/atcoder-workspace/ --rm --name atcoder-env-container atcoder-env /bin/bash
    ```
1. Solve Probles using atcoder-tools 
    - [atcoder-tools repository](https://github.com/kyuridenamida/atcoder-tools)

## Example Commands
- Create Environment
    ``` bash
    git clone https://github.com/mtsalt/atcoder-python-env.git
    cd atcoder-python-env
    docker image build --build-arg USER_ID=$(id -u) --build-arg USER_GROUP=$(id -g) -t atcoder-env . 
    cd ../atcoder-solutions
    docker run -it -v ./:/home/envuser/atcoder-workspace/ --rm --name atcoder-env-container atcoder-env /bin/bash
    ```
- Solve Problem
    ``` bash
    atcoder-tools gen abc345
    cd abc345/A
    atcoder-tools test
    atcoder-tools submit
    ```
