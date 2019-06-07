# The current dockerfile is based on davidshen84/scikit-learn
FROM python:3

RUN pip3 install --upgrade pyzmq --install-option="--zmq=bundled" && \
    pip3 install --upgrade jupyter

RUN apt-get update && apt-get install -y \
    build-essential \
    gfortran \
    libblas-dev \
    liblapack-dev \
    libxft-dev \
    && rm -rf /var/lib/apt/lists/*

# order matters
RUN pip3 install --upgrade \
    numpy \
    scipy \
    scikit-learn \
    matplotlib \
    pandas

RUN pip3 install keras
RUN pip3 install tensorflow
RUN pip3 install seaborn
