const express = require('express')
const bodyParser = require('body-parser')
const app = express()
var cors = require('cors')

const port = process.env.PORT || 3000

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(express.static('public'));
app.use(cors())
app.listen(port, function () {
  console.log('CORS-enabled web server listening on port ' + port)
})

// let routes = require('./router')
// routes(app)