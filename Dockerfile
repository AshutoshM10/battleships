
# choosing-base image
FROM centos:latest

RUN cd /etc/yum.repos.d/ && \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# updating dependencies
RUN yum update -y 

# installing the npm package

RUN curl -sL https://rpm.nodesource.com/setup_13.x | bash - 
RUN yum install nodejs -y 

# Install pm2
RUN npm install -g pm2

# setting up the working directory

WORKDIR /opt/app/

# copying everything from the reposiory to the container
COPY . .

# installing dependencies
RUN npm install

# exposing port 80
EXPOSE 3000

# start the project with pm2 
CMD npm start 



