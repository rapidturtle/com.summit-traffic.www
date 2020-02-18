FROM node:latest

LABEL maintainer="Andrew Porter <aporter@rapidturtle.com>"
LABEL name="summit-traffic"

##
# Set any environment variables
ENV APP_DIR=/home/app/summit-traffic

##
# Install Angular CLI
RUN yarn global add @angular/cli && ng config -g cli.packageManager yarn
