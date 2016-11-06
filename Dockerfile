FROM arizonatribe/centos
MAINTAINER David Nunez <arizonatribe@gmail.com>

# Default locations for Node Version Manager and version of Node to be installed
ENV NODE_VERSION 6.9.0
ENV NVM_DIR /.nvm
ENV PATH $NVM_DIR/v$NODE_VERSION/bin:$PATH
     
# Default version of Node to be installed; can be overridden
RUN git clone https://github.com/creationix/nvm.git $NVM_DIR
RUN echo ". $NVM_DIR/nvm.sh" >> /etc/bash.bashrc

# Install node.js
RUN source $NVM_DIR/nvm.sh \
    && nvm install v$NODE_VERSION \
    && nvm use v$NODE_VERSION \
    && nvm alias default v$NODE_VERSION \
    && ln -s $NVM_DIR/versions/node/v$NODE_VERSION/bin/node /usr/bin/node \
    && ln -s $NVM_DIR/versions/node/v$NODE_VERSION/bin/npm /usr/bin/npm
