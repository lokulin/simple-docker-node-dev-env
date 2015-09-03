FROM node:0.10

# Set up a shared workspace
ADD add_user.sh /add_user.sh
RUN /add_user.sh \
    && rm add_user.sh \
    && mkdir -p /home/app \
    && mkdir /app \
    && chown -R app:app /home/app \
    && chown -R app:app /app \
    && npm install -g grunt-cli bower
VOLUME /app
WORKDIR /app
USER app
EXPOSE 9000
cmd [ "node" ]
