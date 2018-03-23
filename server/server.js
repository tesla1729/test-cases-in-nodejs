var express = require('express');
var bodyParser = require('body-parser');
var {router} = require('./routes/apiRoutes');

const port = process.env.PORT || 3000;

var app = express();
app.use(bodyParser()); 

app.use('/api', router);

app.listen(port, () => {
  console.log("Server started on " + port);
});

module.exports = {
  app
}
