const axios = require('axios');
const fs = require('fs');
const _ = require('lodash');
const querystring = require('querystring');
const { argv } = require('yargs');

_.templateSettings.interpolate = /{{([\s\S]+?)}}/g;

const EVENT_PAYLOAD = JSON.parse(fs.readFileSync(process.env.GITHUB_EVENT_PATH, 'utf8'));

const rawMessage = argv._.join(' ');
const message = _.template(rawMessage)({ ...process.env, EVENT_PAYLOAD });

const rawTopics = process.env.MERCURE_TOPICS.split(',');
const topics = rawTopics.map(topic => _.template(topic)({ ...process.env, EVENT_PAYLOAD }));

const url = process.env.MERCURE_HUB_URL;
const type = process.env.MERCURE_TYPE || 'message';
const private = process.env.MERCURE_PRIVATE;

(async () => {
  console.log('Sending event ...');
  await axios.post(
    url,
    querystring.stringify({
      topic: topics.join(','),
      data: message,
      type,
      ...(typeof private !== 'undefined') && { private },
    }),
    {
      headers: {
        'Authorization': `Bearer ${process.env.MERCURE_HUB_JWT}`,
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    });
  console.log('Event sent ! Shutting down ...');
  process.exit(0);
})()
  .catch((err) => {
    console.error(err.message);
    console.error('Message :', err.response.data);
    process.exit(1);
  });
