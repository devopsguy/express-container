const express = require('express')
const os = require('os')
const app = express()
const port = 3000

let response = "Hello Express from " + os.hostname() + "!"

app.get('/', (req, res) => {
  res.send(response)
})

app.listen(port, () => {
  console.log(`Hello Express app listening on port ${port}`)
})