var Method = require('./methodModel');
var _ = require('lodash');

exports.params = function(req, res, next, id) {
  Method.findById(id)
    .then(function(met) {
      if (!met) {
        next(new Error('There is no method with that id'));
      } else {
        req.met = met;
        next();
      }
    }, function(err) {
      next(err);
    });
};

exports.get = function(req, res, next) {
  Method.find()
    .then(function(methods){
      res.json(methods);
    }, function(err){
      next(err);
    });
};

exports.getOne = function(req, res, next) {
  var met = req.met;
  res.json(met);
};

exports.put = function(req, res, next) {
  var met = req.met;

  var update = req.body;

  _.merge(met, update);

  met.save(function(err, saved) {
    if (err) {
      next(err);
    } else {
      res.json(saved);
    }
  })
};

exports.post = function(req, res, next) {
  var newmethod = req.body;

  Method.create(newmethod)
    .then(function(met) {
      res.json(met);
    }, function(err) {
      next(err);
    });
};

exports.delete = function(req, res, next) {
  req.met.remove(function(err, removed) {
    if (err) {
      next(err);
    } else {
      res.json(removed);
    }
  });
};
