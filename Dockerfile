# build the sapper app
FROM timbru31/node-alpine-git:12
COPY . .
WORKDIR /frontend
RUN npm install
RUN npm run build
EXPOSE 3000
CMD ["node", "__sapper__/build"]