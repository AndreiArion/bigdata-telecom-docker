FROM python:2.7.18-alpine

### 2. Get Java via the package manager
RUN apk update \
&& apk upgrade \
&& apk add --no-cache bash \
&& apk add --no-cache --virtual=build-dependencies unzip \
&& apk add --no-cache curl \
&& apk add --no-cache openjdk8-jre

### 3. Get Python, PIP


### 4. Install ccm
RUN pip install ccm

### 5. Create some test clusters with ccm
RUN ccm create test -v 2.1.16 -n 3
RUN ccm create test_2_1_16 -v 2.1.16 -n 3
RUN ccm create test_3_0_15 -v 3.0.15 -n 3 

### Fix JNA problem for arm64 arch  (mac M1) 
### https://stackoverflow.com/questions/69486339/nativelibrarydarwin-java64-failed-to-link-the-c-library-against-jna-native-m
RUN cd ~/.ccm/repository/3.0.15/lib/;rm jna-4.2.2.jar; wget https://search.maven.org/remotecontent?filepath=net/java/dev/jna/jna/5.8.0/jna-5.8.0.jar
RUN cd

### TODO
### Install spark
### Install scala-notebooks
### Install neo4j

CMD bash
