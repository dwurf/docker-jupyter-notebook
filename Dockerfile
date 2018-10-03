FROM ubuntu:18.04

LABEL maintainer="Darren Wurf <github@darrenwurf.com>"
LABEL version="v0.2.0-ubuntu"

RUN apt-get update \
  && apt-get -y install --no-install-recommends \
        python3 \
        # For building pip packages:
        build-essential \
        python3-dev \
        python3-pip \
        python3-setuptools \
        # Required by some pip packages:
        cython3 \
        # Other pip package dependencies:
        libsnappy-dev \
        # For jupyterlab extensions:
        nodejs \
        npm \
        # For pymssql3 troubleshooting:
        freetds-bin \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache --upgrade pip
RUN pip3 install --no-cache \
    # Jupyter Lab
    jupyterlab \
    # Tools for working with tabular / scientific data
	pandas \
	pandas-msgpack \
    # DataTable storage
	feather-format \
	fastparquet \
	parquet \
    # Visualisation
    plotly \
	graphviz \
	seaborn \
    # Data connectivity
	pymssql \
    psycopg2 \
	sqlalchemy-redshift \
    # Improved versions of python standard libraries
    # https://wiki.python.org/moin/UsefulModules#Standard_Library_Enhancements
    path.py \
    requests \
    python-dateutil \
    pytz \
    sh \
    # Tools for handling various data formats
    lxml \
    beautifulsoup4 \
    jmespath \
    sqlalchemy \
    pyyaml \
    chardet \
    # Cloud
    boto3

RUN jupyter labextension install \
    @jupyter-widgets/jupyterlab-manager \
    @jupyter-widgets/jupyterlab-sidecar \
    @jupyterlab/plotly-extension \
    jupyterlab_bokeh \
    qgrid \
    pylantern \
    jupyter-leaflet \
    @jupyterlab/git \
    @jupyterlab/toc \
    @jupyterlab/statusbar \
 && npm cache clean --force

RUN useradd -m ubuntu \
    && mkdir /notebooks \
    && chown ubuntu.ubuntu /notebooks
VOLUME /notebooks
WORKDIR /notebooks
USER ubuntu

CMD jupyter lab --no-browser --ip 0.0.0.0 --port 8888 /notebooks

# Extension wishlist (waiting for jupyter lab versions)
    #jupyter nbextensions_configurator enable --sys-prefix && \
	#jupyter nbextension enable execute_time/ExecuteTime --sys-prefix && \
	#jupyter nbextension enable toc2/main --sys-prefix && \
	#jupyter nbextension enable notify/notify --sys-prefix && \
