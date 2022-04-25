// Lambda function code

module.exports.handler = async (event) => {
  console.log('Event: ', event);
  let greeting = 'Hello';
  let name = 'World';

  if (event.queryStringParameters) {
    if (event.queryStringParameters['Name']) {
      name = event.queryStringParameters['Name'];
    }
    if (event.queryStringParameters['Greeting']) {
        greeting = event.queryStringParameters['Greeting'];
    }
  }

  let responseMessage = greeting + ' ' + name + '!';

  return {
    statusCode: 200,
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      message: responseMessage,
    }),
  }
}
