# base image on which current docker image will be built
FROM node

# the directory in which the we place the node app
WORKDIR /app

# copy package.json file to the working directory
COPY package.json .

# install required packages
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi

# copy all the source files to working directory
COPY . .

# create env variable
ENV PORT 3000

# expose the ports that are used by the app
EXPOSE $PORT

# execute command to start the app
CMD ["node", "index.js"]
