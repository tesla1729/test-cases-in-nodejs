FROM node:18

RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 \
    && chmod +x /usr/local/bin/argocd

# Set the working directory to /app
WORKDIR /app

# Copy code to work dir
COPY . .

# Install Node.js dependencies
RUN make install-playwright
RUN make install-report-dependencies

# Set the default command to run npm test
CMD ["sleep", "10000"]
