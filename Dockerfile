#Build Phase
FROM node:alpine AS builder 
# This tells Docker that this is the build phase (as builder)
WORKDIR '/app'
COPY  package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase 
FROM nginx 
EXPOSE 80 
# this expose is what we added for production port mapping.
# using elasticsbeanstalk uses to expose the app to the port
#Note : it does no tmatter for the docker
# This shows that the new phase is the RUN phase
COPY --from=builder /app/build /usr/share/nginx/html   
 # this tells docker that we need to copy files from the build phase
 # /app/builder :the path to the production files
 # /usr/share/nginx/html   copy from  [/app/builder] to [/usr/share/nginx/html  ]



