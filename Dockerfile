FROM node:10.16.0-slim
RUN npm install -g lerna

RUN  apt-get update \
    && apt-get install python-dev python-pip git -y \
    # Install latest chrome dev package, which installs the necessary libs to
    # make the bundled version of Chromium that Puppeteer installs work.
    && apt-get install -y wget jq --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && wget --quiet https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /usr/sbin/wait-for-it.sh \
    && chmod +x /usr/sbin/wait-for-it.sh


RUN pip install --upgrade awscli
RUN aws --version

