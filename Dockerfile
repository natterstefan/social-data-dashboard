ARG node_version=14.15
ARG node_image=node:${node_version}-alpine

FROM $node_image

WORKDIR /app

# configs and dependency handling
COPY package.json yarn.lock ./

# install all dependencies
RUN yarn install --frozen-lockfile --no-progress

# source code of the app
COPY src/ ./

# expose the port
EXPOSE 3001

# run the app
CMD ["node", "."]