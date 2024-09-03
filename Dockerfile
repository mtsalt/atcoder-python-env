FROM python:3.10

WORKDIR /root/atcoder-workspace

COPY ./requirements.txt ./requirements.txt

RUN pip install -r requirements.txt \
 && rm requirements.txt

COPY ./.atcodertools.toml /root/.atcodertools.toml

