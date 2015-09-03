FROM node:0.10

# Set up a shared workspace
ADD ./add_user.sh /add_user.sh
RUN /add_user.sh && rm add_user.sh
RUN mkdir -p /home/app \
    && mkdir /app \
    && chown -R app:app /home/app \
    && chown -R app:app /app
VOLUME /app
WORKDIR /app

# Initialise the environment
RUN npm install -g grunt-cli bower

USER app

cmd [ "node" ]
