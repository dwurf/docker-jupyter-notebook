# docker-jupyter-notebook
Docker image building on Jupyter Scipy Notebook image

Changes:

* Update pandas to latest version
* Include nbextensions, enable toc, notify, executetime extensions
* include pymssql, parquet, feather modules

Usage:

    sudo docker run --rm -ti -p 8888:8888 -v "$PWD:/home/jovyan/work" dwurf/docker-jupyter-notebook:latest start-notebook.sh 

or with Jupyter Lab:

    sudo docker run --rm -ti -p 8888:8888 -v "$PWD:/home/jovyan/work" dwurf/docker-jupyter-notebook:latest start.sh jupyter lab


Building:

    sudo docker build -t dwurf/docker-jupyter-notebook .

