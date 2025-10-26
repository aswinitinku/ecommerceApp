# Use a small official node image
FROM node:18-alpine

# Create app dir
WORKDIR /usr/src/app

# Copy package files first (cache deps)
COPY package*.json ./

# Install dependencies
# RUN npm ci --only=production

# Copy app source
COPY . .

# Build if required (uncomment if build step needed)
# RUN npm run build

# Expose HTTP port
EXPOSE 80

# If app listens on 3000 internally, set PORT env var or run using npm start
ENV PORT=80

# Use a simple start command (update if your start script differs)
CMD ["node", "index.js"]

