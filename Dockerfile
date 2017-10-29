FROM 672626379771.dkr.ecr.us-east-1.amazonaws.com/mit-thing-base

RUN mkdir /opt/touchstone-sp

COPY src /opt/touchstone-sp/src
COPY pom.xml /opt/touchstone-sp/
COPY build.sh /opt/touchstone-sp/

RUN chmod 777 /opt/touchstone-sp/build.sh

RUN cd /opt/touchstone-sp && ls -l && ./build.sh

EXPOSE 8443

ENTRYPOINT java -jar /opt/touchstone-sp.war  && bash