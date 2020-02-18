FROM node:latest

LABEL maintainer="Andrew Porter <aporter@rapidturtle.com>"
LABEL name="summit-traffic"

##
# Set any environment variables
ENV APP_DIR=/home/app/summit-traffic

##
# Install Angular CLI
RUN yarn global add @angular/cli && ng config -g cli.packageManager yarn

##
# Create a cache layer with package.json for node_modules
COPY package.json yarn.lock /tmp/
RUN cd /tmp && yarn

##
# Create the application directory and copy the node_modules in
WORKDIR ${APP_DIR}
RUN cp -a /tmp/node_modules .

COPY . .

EXPOSE 4200

CMD [ "ng", "serve", "--host=0.0.0.0", "--disabledHostCheck" ]
