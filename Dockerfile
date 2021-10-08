FROM "openshift/jenkins@sha256:02310a4743e1dddb29b37a75ebf10ad0279621b31f31b3f1201433c59736696c" as jenkins

USER root
WORKDIR /usr/lib/jenkins/
RUN ls -lst jenkins.war
RUN rm -f jenkins.war
RUN wget --quiet https://updates.jenkins.io/download/war/2.263.4/jenkins.war
RUN ls -lst jenkins.war

VOLUME ["/var/lib/jenkins"]

USER 1001
ENTRYPOINT ["/usr/bin/go-init", "-main", "/usr/libexec/s2i/run"]
