FROM node
WORKDIR /usr/src/app
COPY [ "server.js","index.html","package.json","./" ]

RUN ["npm", "config", "rm proxy"]
RUN ["npm", "config", "rm https-proxy"]
RUN ["npm", "config", "--global", "rm proxy"]
RUN ["npm", "config", "--global", "rm https-proxy"]
RUN ["npm", "config", "set registry http://registry.npmjs.org"]
RUN ["npm", "config", "set strict-ssl false"]

RUN npm install ;\
    mkdir data
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
CMD [ "npm", "start" ]
