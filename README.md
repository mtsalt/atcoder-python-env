# atcoder-python-env
A Dockerized Python environment for running AtCoder problems locally. Includes pre-configured dependencies and tools for seamless local testing.

# Requirements
- Docker (version 27.1.2 or higher)

# How to use
You can set up the environment just by copying and pasting.

1. Build Environment
    1. Build Image 
        ```
        docker image build -t atcoder-python .
        ```
        - -t : Build image as atcoder-python
    1. Run Container  
        ```
        docker container run -itd --rm --name atcoder-python-env -v ./solutions:/root/atcoder-workspace atcoder-python
        ```
        - --rm : Delete the container when it is stopped.
        - -v : Mount the `solutions` directory from the host to `atcoder-workspace` in the guest.
    1. Attach Container  
        ```
        docker container exec -it atcoder-python-env /bin/bash
        ```
1. Generate Contest Directory
    1. Initialize Contest
        ```
        atcoder-tools gen abc[contest number]
        ```
    1. test
        ```
        atcoder-tools test
        ```
1. Delete Environment
    1. Delete Container
        ```
        docker container stop atcoder-python-env
        ```
    1. Delete Image
        ```
        docker image rm atcoder-python
        ```