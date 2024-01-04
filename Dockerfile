FROM node:18.17.1 as stage

WORKDIR /src/app
COPY . .
RUN npm install
RUN npm run build

FROM node:18.17.1

WORKDIR /src/app
COPY --from=stage /src/app/dist ./dist
CMD ["node", "dist/main.js"]

