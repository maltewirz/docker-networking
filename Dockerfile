FROM docker-remote.artifactory.ham.hella.com/node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["node", "app.js"]