#pull node.js original docker image
FROM node:16-alpine

#set the working dir inside the container
WORKDIR /usr/src/app

#Copy package.json and package-lock.json in the working dir
COPY package*.json ./

#Intall all needed packages provided in the package.json file
RUN npm install

#Copy the bundled app inside the Docker image
COPY . .

#Build the application
RUN npm run build

#Install serve to run the app
RUN npm install -g serve

#We will expose the port that will run the app
EXPOSE 4000

#Run serve to start the container and the app
CMD ["serve", "-s", "build", "-l", "4000"]