# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM jupyter/scipy-notebook

LABEL maintainer="Darren Wurf <github@darrenwurf.com>"
LABEL version="v0.2.0"

USER $NB_UID

RUN conda install --quiet --yes \
	-c conda-forge \
    jupyter_contrib_nbextensions \
	'plotly' \
	'pymssql' \
	'sqlalchemy-redshift' \
	'feather-format' \
	'pandas' \
	'pandas-msgpack' \
	'fastparquet' \
	'python-graphviz' \
	'parquet-cpp' && \
    conda clean -tipsy && \
    # Activate some useful extensions by default
    jupyter nbextensions_configurator enable --sys-prefix && \
	jupyter nbextension enable execute_time/ExecuteTime --sys-prefix && \
	jupyter nbextension enable toc2/main --sys-prefix && \
	jupyter nbextension enable notify/notify --sys-prefix && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR && \
	fix-permissions /home/$NB_USER

