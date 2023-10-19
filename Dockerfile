FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

COPY * /DGAPI/
WORKDIR /DGAPI/

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    python3-pip \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --upgrade setuptools wheel pip \
    && pip3 install numpy faker flask pandas spacy st-annotated-text streamlit \
    && python3 -m spacy download en_core_web_sm 

EXPOSE 6155

ENTRYPOINT ["python3", "dg_api.py"]