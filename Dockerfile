FROM amazonlinux:2
#AS BUILD_IMAGE

# couchbase sdk requirements
RUN yum upgrade -y
RUN yum install -y python make gcc curl gcc-c++
# let's get node
RUN curl -sL https://rpm.nodesource.com/setup_16.x | bash -
RUN yum install -y nodejs

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./
COPY .npmrc .npmrc
RUN npm ci

COPY . .

ARG ENV
RUN if [ "$ENV" = "QA" ] ; then npm run build:test ; else npm run build ; fi
RUN rm -f .npmrc

EXPOSE 3000
CMD [ "npm", "start" ]