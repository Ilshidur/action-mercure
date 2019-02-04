const axios = require('axios');
const _ = require('lodash');
const querystring = require('querystring');
const { argv } = require('yargs');

_.templateSettings.interpolate = /{{([\s\S]+?)}}/g;

const rawMessage = argv._.join(' ');
const message = _.template(rawMessage)(process.env);

const rawTopics = process.env.MERCURE_TOPICS.split(',');
const topics = rawTopics.map(topic => _.template(topic)(process.env));

const url = process.env.MERCURE_HUB_URL;

(async () => {
  console.log('Sending event ...');
  await axios.post(
    url,
    querystring.stringify({
      topic: topics.join(','),
      data: message
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
