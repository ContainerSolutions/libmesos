From pierrevincent/gradle-java8

# based on https://github.com/mesosphere/docker-containers/blob/master/libmesos/ubuntu:13.10 with java excluded
RUN ["env", "DEBIAN_FRONTEND=noninteractive", "apt-get", "update"]
RUN ["env", "DEBIAN_FRONTEND=noninteractive", "apt-get", "install", "-y", "--fix-missing", "--force-yes", "python2.7", "libsasl2-2", "libcurl3", "curl", "wget", "unzip"]
RUN ["env", "DEBIAN_FRONTEND=noninteractive", "apt-get", "install", "-y", "--fix-missing", "--force-yes", "python", "python-setuptools", "python-pip", "python-protobuf"]

ADD http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.19.0-xcon2_amd64.deb /tmp/mesos.deb
RUN ["env", "DEBIAN_FRONTEND=noninteractive", "dpkg", "-i", "/tmp/mesos.deb"]
RUN ["bash", "-c", "echo manual > /etc/init/mesos-master.override"]
RUN ["bash", "-c", "echo manual > /etc/init/mesos-slave.override"]

ADD http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.19.0-xcon2_amd64.egg /tmp/mesos.egg
RUN ["easy_install", "/tmp/mesos.egg"]

RUN ["rm", "-rf", "/tmp/mesos.egg", "/tmp/mesos.deb"]

CMD ["true"]


