# docker-jupyter-notebook
JupyterLab notebook in Docker

Features:

* Includes many useful python extensions (pandas, lxml, boto3, ...)
* Includes some popular Jupyter Lab extensions (ipywidgets, ipyleaflet, ...)
* Smaller than e.g. jupyter/scipy-notebook (2GB instead of 4.7GB)

#Usage:

    sudo docker run --rm -ti \
        -p 8888:8888 \
        -v "$PWD:/home/jovyan/work" \
        dwurf/docker-jupyter-notebook:latest \
        start-notebook.sh

or with Jupyter Lab:

    sudo docker run --rm -ti \
        -p 8888:8888 \
        -v "$PWD:/home/jovyan/work" \
        dwurf/docker-jupyter-notebook:latest \
        start.sh jupyter lab

#Building

    sudo docker build -t dwurf/docker-jupyter-notebook .

