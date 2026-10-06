exports.handler = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: "Hello from Node.js + Terraform + LocalStack",
      event: event
    })
  };
};
