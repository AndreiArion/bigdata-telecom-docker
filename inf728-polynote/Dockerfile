ARG POLYNOTE_VERSION="0.4.10"

FROM eclipse-temurin:11.0.12_7-jdk



ARG SPARK_VERSION="3.3.1"
ARG POLYNOTE_VERSION
ARG SCALA_VERSION="2.12"
ARG DIST_TAR="polynote-dist.tar.gz"

WORKDIR /opt

RUN apt update -y && \
    apt install -y wget python3 python3-dev python3-pip build-essential git

RUN wget -q https://github.com/polynote/polynote/releases/download/$POLYNOTE_VERSION/$DIST_TAR && \
    tar xfzp $DIST_TAR && \
    echo "DIST_TAR=$DIST_TAR" && \
    rm $DIST_TAR

RUN pip3 install -r ./polynote/requirements.txt

# to wrap up, we create (safe)user
ENV UID 1000
ENV NB_USER polly

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${UID} \
    ${NB_USER}

# allow user access to the WORKDIR
RUN chown -R ${NB_USER}:${NB_USER} /opt/

# start image as (safe)user
USER ${NB_USER}

# expose the (internal) port that polynote runs on
EXPOSE 8192

# use the same scala version for server
ENV POLYNOTE_SCALA_VERSION ${SCALA_VERSION}

# copy configuration
COPY config.yml ./polynote/config.yml

# install spark
WORKDIR /opt/spark/work-dir
RUN wget https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.tgz
RUN tar -xvf spark-${SPARK_VERSION}-bin-hadoop3.tgz
RUN mv spark-${SPARK_VERSION}-bin-hadoop3/* /opt/spark
WORKDIR /opt/spark
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
ENV PYSPARK_PYTHON=python3

# start polynote on container run
WORKDIR /opt

ENTRYPOINT ["./polynote/polynote.py"]