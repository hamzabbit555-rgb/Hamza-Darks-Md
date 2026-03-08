FROM node:lts-buster

# System dependencies install karein
RUN apt-get update && apt-get install -y \
  git \
  ffmpeg \
  curl \
  && rm -rf /var/lib/apt/lists/*

# Working directory set karein
WORKDIR /app

# Sabse pehle package files copy karein (caching ke liye behtar hai)
COPY package.json .

# Dependencies install karein
RUN npm install && npm install -g pm2

# Baaki saari files copy karein
COPY . .

# Port expose karein
EXPOSE 9090

# Bot ko PM2 ke zariye start karein taaki ye crash hone par auto-restart ho sake
CMD ["pm2-runtime", "start", "index.js", "--name", "hamza-md"]
