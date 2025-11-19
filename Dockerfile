# Use Node.js Alpine base image
#FROM node:alpine

# Create and set the working directory inside the container
#WORKDIR /app

# Copy package.json and package-lock.json to the working directory
#COPY package.json package-lock.json /app/

# Install dependencies
#RUN npm install

# Copy the entire codebase to the working directory
#COPY . /app/

# Expose the port your container app
#EXPOSE 3000    

# Define the command to start your application (replace "start" with the actual command to start your app)
#CMD ["npm", "start"]


FROM node:18-alpine AS build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# Step 2: Serve the built app using Nginx
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html


EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

