# cnndocker

## Objective

Create a Docker image that can be used for Convolutional Neural Networks (CNN) development with Python.

## Dockerfile

The Dockerfile contains the instructions for building the container image.

## Publishing

The [Singularity](https://www.sylabs.io/guides/3.2/user-guide/quick_start.html) tool expects a Docker image to be pulled
from the [Docker Hub](https://hub.docker.com/). In this way,
after being built on the local machine it must be uploaded to the hub. The instructions for doing that are as from
[here](https://hackernoon.com/publish-your-docker-image-to-docker-hub-10b826793faf), assuming that we want to name
our image `cnndocker`.

1. `docker build -t cnndocker -f Dockerfile .`
2. `docker tag cnndocker <Docker hub username>/cnndocker:v0.1`
3. `docker push <Docker hub username>/cnndocker:v0.1`

Mine is available in `ghapereira/cnndocker`

## Running with Singularity

Instructions as with my user.

1. Create a Singularity image: `sudo singularity build --sandbox cnndocker/ docker://ghapereira/cnndocker`
2. Go into directory `/srv/storage/forge` and run `singularity shell cnndocker/`
3. If you want to interact with files in the host from the Singularity container, please check
[this](https://www.sylabs.io/guides/3.2/user-guide/quick_start.html#working-with-files). Essentialy, Singularity
mounts `/home/$USER`, `/tmp` and `$PWD` into your container at runtime. In addition the parameter `--bind` can be used together with `singularity exec` to specify additional directories.

## Housekeeping

As from [here](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes),
one way to check the images you have in your machine is with the command `docker images`. To clean unused images,
`docker system prune`.
