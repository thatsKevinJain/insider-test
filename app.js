const express = require('express')
const app = express()
const port = 3000

// Number that will be assigned to each pod //
// This is being done to test load balancing //
const RANDOM_NUMBER = (Math.floor(Math.random() * 100) + 1)

app.get('/', (req, res) => {
	res.json({ "pod-number": RANDOM_NUMBER });
})

app.listen(port, () => {
	console.log(`Example app listening at http://localhost:${port}`)
})