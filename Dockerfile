# base image on which current docker image will be built
FROM node

# the directory in which the we place the node app
WORKDIR /app

# copy package.json file to the working directory
COPY package.json .

# install required packages
RUN npm install 

# copy all the source files to working directory
COPY . .

# expose the ports that are used by the app
EXPOSE 3000

# execute command to start the app
CMD ["node", "index.js"]
