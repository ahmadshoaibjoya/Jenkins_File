
FROM jenkins/jenkins:2.414.3-jdk17
# Switch to root user for installing additional packages
USER root
# Install lsb-release and python3-pip packages. -y is for yes
RUN apt-get update && apt-get install -y lsb-release python3-pip
# Download GPG key of the repository and store it as "docker-archive-keyring.asc" filename
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg
# Introduce the docker repository to the /etc/apt/sources.list.d configuration directory
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
# Update package lists and install docker-ce-cli
RUN apt-get update && apt-get install -y docker-ce-cli
# Switch back to the default Jenkins user
USER jenkins
# Install 2 plugins in jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"



