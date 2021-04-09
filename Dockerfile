FROM debian

RUN mkdir /rpmtmp/
RUN apt-get update \
    && apt-get install -y wget \
    && wget -O /rpmtmp/amazon-ssm-agent.rpm https://s3.us-east-1.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

COPY runonhost.sh /
COPY wait.sh /
RUN chmod u+x runonhost.sh
CMD ["./runonhost.sh"]
