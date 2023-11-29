FROM jenkins/jenkins:2.426.1-jdk17
USER root

# Install lsb-release equivalent for Red Hat
RUN yum install -y python3-distro

# Install Docker CLI
RUN curl -fsSL https://download.docker.com/linux/centos/docker-ce.repo -o /etc/yum.repos.d/docker-ce.repo
RUN yum install -y docker-ce-cli

USER jenkins

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
