const express = require('express');

const app = express();

const PORT = 3000;

app.get('/', (req, res) => {
    res.send('Microservice deployed successfully using Jenkins and AWS CodeDeploy!');
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
