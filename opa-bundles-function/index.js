'use strict';

const storage = require('@google-cloud/storage')();

exports.helloGET = (req, res) => {
  res.send('Hello world!');
};

exports.opaBundleServer = (req, res) => {
  console.log('path: ' + req.path);
  if (req.path) {
    const file = storage.bucket('opabundles').file(req.path + '/bundle.tar.gz');
    if (file) {
      const fileReadStream = file.createReadStream();
      res.setHeader('Content-Disposition', 'attachment; filename=bundle.tar.gz');
      res.setHeader('Content-Type', 'application/octet-stream');
      fileReadStream.pipe(res);
    } else {
      res.status(404).send('Bundle not found');
    }
  } else {
    res.status(400).send('No bundle name passed!');
  }
};
