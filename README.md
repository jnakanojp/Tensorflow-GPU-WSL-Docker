# Tensorflow 2.12 (with CUDA) on WSL2 Docker
2023/5/8 Junichi Nakano jnakano [at] kokugakuin.ac.jp

## How to use

1. Please review the following document and complete installing NVIDIA driver, docker and NVIDIA Container Toolkit.<br>
https://zenn.dev/holliy/articles/e1ac7f2f806c35

1. (Optional) Please review the following document and complete installing docker-compose.<br>
https://matsuand.github.io/docs.docker.jp.onthefly/compose/install/

1. Clone this repository.

1. Change Dockerfile as you need.
Example: If you want to change tensorflow version, please change the argument of FROM command(Line 1). You can choose image name from the list in the following webpage.<br>
https://hub.docker.com/r/tensorflow/tensorflow/tags

1. Change `docker-compose.yml` as you need.<br>
    If you use the docker-compose.yml in this repository as is, /home/jnakano/work on WSL2 will be bind-mounted to /root/work in Docker. Many people may want to fix this point. Please change volumes settings on Line 5-6.

1. Build and run (Building is only necessary on the first startup after changes to the Dockerfile.)<br>
    ```
    cd /path/to/this/repository
    docker-compose up --build
    ```
    or the equivalent docker command for the above if you don't install docker-compose.<br>
    <br>
    From the second time onwards, you can start the container with just `docker-compose up` without specifying `--build`.

1. Execute the command what you want.<br>
Example:
    1. Bash<br>
    ```docker exec -it tf-gpu-212_tensorflow-2.12-gpu_1 /bin/bash```
    1. nvidia-smi<br>
    ```docker exec tf-gpu-212_tensorflow-2.12-gpu_1 /usr/bin/nvidia-smi```
    1. Jupyter Notebook<br>
    ```docker exec tf-gpu-212_tensorflow-2.12-gpu_1 jupyter notebook```
