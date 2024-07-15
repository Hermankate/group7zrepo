const {PubSub} = require('@google-cloud/pubsub');
const admin = require('firebase-admin');
const serviceAccount = require('./path-to-your-service-account-file.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const pubsub = new PubSub();

const topicName = 'job-postings';
const subscriptionName = 'job-category-subscription';

const subscription = pubsub.subscription(subscriptionName);

const messageHandler = message => {
  console.log(`Received message ${message.id}:`);
  console.log(`Data: ${message.data}`);
  console.log(`Attributes: ${message.attributes}`);

  const data = JSON.parse(message.data);

  const payload = {
    notification: {
      title: 'New Job Posted',
      body: `${data.title} in ${data.category} category`,
      sound: 'default',
    },
    data: {
      click_action: 'FLUTTER_NOTIFICATION_CLICK',
      message: `${data.title} in ${data.category} category`,
    },
  };

  admin.messaging().sendToTopic(data.category, payload)
    .then(response => {
      console.log('Successfully sent message:', response);
    })
    .catch(error => {
      console.log('Error sending message:', error);
    });

  message.ack();
};

subscription.on('message', messageHandler);
