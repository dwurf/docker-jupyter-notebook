# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM jupyter/scipy-notebook

LABEL maintainer="Darren Wurf <github@darrenwurf.com>"

USER $NB_UID

RUN conda install --quiet --yes \
	-c conda-forge \
	'jupyter_contrib_nbextensions' \
	'plotly' \
	'pymssql' \
	'sqlalchemy-redshift' \
	'feather-format' \
	'pandas' \
	'pandas-msgpack' \
	'fastparquet' \
	'parquet-cpp' && \
    conda clean -tipsy && \
    # Activate ipywidgets extension in the environment that runs the notebook server
	jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    # Install notebook extensions
	jupyter contrib nbextension install --user && \
    # Activate useful extensions
	jupyter nbextension enable execute_time/ExecuteTime && \
	jupyter nbextension enable toc2/main && \
	jupyter nbextension enable notify/notify && \
    fix-permissions $CONDA_DIR && \
	fix-permissions /home/$NB_USER

