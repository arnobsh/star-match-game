# base image
FROM node:9.6.1

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /usr/src/app/package.json
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent

# run required dependencies

RUN npm i express
RUN npm i -D nodemon
RUN npm i react react-dom
RUN npm i webpack webpack-cli
RUN npm i babel-loader @babel/core @babel/node @babel/preset-env @babel/preset-react
RUN npm i -D eslint babel-eslint eslint-plugin-react
RUN npm i -D jest babel-jest react-test-renderer

EXPOSE 4242

# start app
CMD ["npm", "start"]