const express = require('express');
const os = require('os');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 8080;

app.use(express.static(__dirname));

app.get('/api/host', (req, res) => {
  res.send(os.hostname());
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
