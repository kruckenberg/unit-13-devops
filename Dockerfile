# Dockerfile MUST start with a FROM instruction (sets Base Image)
FROM node:10.1

# Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow
WORKDIR /usr/src/app

# The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the
#  container at the path <dest>.
COPY . /usr/src/app 

# The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. 
# The resulting committed image will be used for the next step in the Dockerfile.
RUN npm install

RUN npm run build

# The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
EXPOSE 3000

# An ENTRYPOINT allows you to configure a container that will run as an executable.
ENTRYPOINT ["node", "./server/server.js"]

# docker build -t mikeandnick/mm-prod .
# docker run -p 3001:3000 mikeandnick/mm-prod

# To actually publish the port when running the container, use the -p flag on docker run to publish
#  and map one or more ports, or the -P flag to publish all exposed ports and map them to high-order ports.