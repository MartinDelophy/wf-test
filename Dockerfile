FROM centos:7
LABEL description="http-server"

ARG root_dir=''
ENV NODE_URL online
RUN curl --silent --location https://rpm.nodesource.com/setup_12.x | bash - && yum install -y nodejs  
COPY . /app/
WORKDIR /app

RUN npm config set registry http://npm.weimob.com
RUN npm install

ENTRYPOINT npm run start

EXPOSE 8080
