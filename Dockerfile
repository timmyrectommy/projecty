FROM node:alpine3.11

# The /app directory should act as the main application directory
WORKDIR /frontend

# Copy the app package and package-lock.json file
COPY package*.json ./
COPY . .

# Install node packages
RUN npm install 

# Build the app
RUN npm run build

# Expose $PORT on container.
# We use a varibale here as the port is something that can differ on the environment.
EXPOSE 3000

# Set host to localhost / the docker image
ENV NUXT_HOST=0.0.0.0

# Start the app
CMD [ "npm", "start" ]