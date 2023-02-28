FROM node:alpine
WORKDIR /app
RUN npm i -g serve
COPY . .
ENV GENERATE_SOURCEMAP=false
RUN yarn run build
RUN rm -rf src
RUN rm -rf _mock
RUN rm -rf _templates
RUN rm -rf node_modules
RUN rm -rf public

ENTRYPOINT ["serve", "-s", "./build"]
