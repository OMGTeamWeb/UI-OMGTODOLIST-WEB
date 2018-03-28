var Bimester = require('./bimesterModel');
var _ = require('lodash');

exports.params = function(req, res, next, id) {
  Bimester.findById(id)
    .then(function(bimester) {
      if (!bimester) {
        next(new Error('There is no bimester with that id'));
      } else {
        req.bimester = bimester;
        next();
      }
    }, function(err) {
      next(err);
    });
};

exports.get = function(req, res, next) {
  Bimester.find()
    .then(function(bimesters){
      res.json(bimesters);
    }, function(err){
      next(err);
    });
};

exports.getOne = function(req, res, next) {
  var bimester = req.bimester;
  res.json(bimester);
};

exports.put = function(req, res, next) {
  var bimester = req.bimester;

  var update = req.body;

  _.merge(bimester, update);

  bimester.save(function(err, saved) {
    if (err) {
      next(err);
    } else {
      res.json(saved);
    }
  })
};

exports.post = function(req, res, next) {
  var newbimester = req.body;

  Bimester.create(newbimester)
    .then(function(bimester) {
      res.json(bimester);
    }, function(err) {
      next(err);
    });
};

exports.delete = function(req, res, next) {
  req.bimester.remove(function(err, removed) {
    if (err) {
      next(err);
    } else {
      res.json(removed);
    }
  });
};
