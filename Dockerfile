FROM mhart/alpine-node:10.22.1

LABEL "com.github.actions.name"="GitHub Action for Mercure"
LABEL "com.github.actions.description"="Send a Mercure publish event."
LABEL "com.github.actions.icon"="send"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/Ilshidur/actions"
LABEL "homepage"="https://github.com/Ilshidur/action-mercure"
LABEL "maintainer"="Ilshidur <ilshidur@gmail.com>"
LABEL "version"="1.1.0"

ADD entrypoint.js package.json package-lock.json /
RUN npm ci
RUN chmod +x /entrypoint.js

ENTRYPOINT ["node", "/entrypoint.js"]
