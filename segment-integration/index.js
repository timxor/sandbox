require('dotenv').config()

const express = require('express')
const app = express()


var Analytics = require('analytics-node');
var analytics = new Analytics(process.env.SEGMENT_WRITE_KEY);


app.get('/', function (req, res) {

  analytics.track({
  userId:'f4ca124298',
  event: 'Signed Up',
  properties: {
    plan: 'Enterprise'
  }
 });

  res.send('Segment API Integration test')
})

console.log()
console.log('server running on http://localhost:3000')



app.listen(3000)

