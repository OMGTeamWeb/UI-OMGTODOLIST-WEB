var Attempt = require('./attemptModel');
var _ = require('lodash');

exports.params = function(req, res, next, id) {
  Attempt.findById(id)
    .then(function(attempt) {
      if (!attempt) {
        next(new Error('There is no attempt with that id'));
      } else {
        req.attempt = attempt;
        next();
      }
    }, function(err) {
      next(err);
    });
};

exports.get = function(req, res, next) {
  Attempt.find()
    .then(function(bimesters){
      res.json(bimesters);
    }, function(err){
      next(err);
    });
};

exports.getOne = function(req, res, next) {
  var attempt = req.attempt;
  res.json(attempt);
};

exports.put = function(req, res, next) {
  var attempt = req.attempt;

  var update = req.body;

  _.merge(attempt, update);

  attempt.save(function(err, saved) {
    if (err) {
      next(err);
    } else {
      res.json(saved);
    }
  })
};

exports.post = function(req, res, next) {
  var newattempt = req.body;

  Attempt.create(newattempt)
    .then(function(attempt) {
      res.json(attempt);
    }, function(err) {
      next(err);
    });
};

exports.delete = function(req, res, next) {
  req.attempt.remove(function(err, removed) {
    if (err) {
      next(err);
    } else {
      res.json(removed);
    }
  });
};
