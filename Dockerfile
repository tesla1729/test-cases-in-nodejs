# Base image
FROM node:latest

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install
RUN npx playwright install --with-deps
RUN npm install --save-dev --save-exact prettier

# Copy the rest of the application code to the container
COPY . .

# Set the default command to run npm test
CMD ["sleep", "10000"]
