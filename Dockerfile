FROM python:3.6-alpine
RUN apk add  --update build-base git python-dev bash curl file openssl perl sudo swig

WORKDIR /usr/src/mecab/
RUN mkdir -p /temp/mecab_src/ && \
    git clone https://github.com/taku910/mecab.git /temp/mecab_src/ && \
    mv -f /temp/mecab_src/mecab/* /usr/src/mecab/ && \
    ./configure --enable-utf8-only && \
    make && \
    make install && \
    pip install mecab-python3 && \
    rm -rf /temp/mecab_src/ && \
    rm -rf /usr/src/mecab/

WORKDIR /usr/src/mecab-ipadic-neologd/
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git . && \
    ./bin/install-mecab-ipadic-neologd -n -y && \
    rm -rf /usr/src/mecab-ipadic-neologd

WORKDIR /var/src/
RUN pip install flask

EXPOSE 80

CMD ["python", "server.py"]
