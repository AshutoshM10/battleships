
# choosing-base image
FROM node:20.1-alpine 
# setting up the working directory
WORKDIR /opt/app/
# copying everything from the reposiory to the container
COPY . .
RUN npm install
# exposing port 80
EXPOSE 3000

# start the project with pm2 
CMD npm start 



