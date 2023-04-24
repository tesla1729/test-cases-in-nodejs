FROM node:18

RUN apt-get update && apt-get install -y \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y gnupg2

RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 \
    && chmod +x /usr/local/bin/argocd
    
# Set the working directory to /app
WORKDIR /app

# Copy code to container
COPY . .

# Install Node.js dependencies
#RUN make install-playwright
#RUN make install-report-dependencies

RUN npm install
# Set the default command to run npm test
CMD ["sleep", "10000"]
