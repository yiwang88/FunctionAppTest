#FROM mcr.microsoft.com/azure-functions/python:2.0
FROM microsoft/azure-functions-python3.6:2.0

ENV LANG en
ENV SPACY_LOG_LEVEL error
ENV SPACY_VERSION 2.0.12

ENV PYVER python3.6
ENV PIPVER pip3.6

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN ${PYVER} -m ensurepip && \
    ${PIPVER} install --upgrade pip setuptools && \
    ${PIPVER} install -r requirements.txt && \
    ${PYVER} -m pip install -U socketIO-client spacy==${SPACY_VERSION} && \
    ${PYVER} -m spacy download ${LANG} &&\
    ${PYVER} -m spacy validate
    
    
