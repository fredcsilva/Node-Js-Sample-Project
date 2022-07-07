FROM node
WORKDIR /usr/src/app
COPY [ "server.js","index.html","package.json","./" ]

CMD ["npm", "config", "rm proxy"]
CMD ["npm", "config", "rm https-proxy"]
CMD ["npm", "config", "--global", "rm proxy"]
CMD ["npm", "config", "--global", "rm https-proxy"]
CMD ["npm", "config", "set registry http://registry.npmjs.org"]
CMD ["npm", "config", "set strict-ssl false"]

RUN npm install ;\
    mkdir data
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
CMD [ "npm", "start" ]
