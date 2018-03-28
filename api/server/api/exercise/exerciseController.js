var Exercise = require('./exerciseModel');
var _ = require('lodash');

exports.params = function(req, res, next, id) {
  Exercise.findById(id)
    .then(function(exercise) {
      if (!exercise) {
        next(new Error('There is no exercise with that id'));
      } else {
        req.exercise = exercise;
        next();
      }
    }, function(err) {
      next(err);
    });
};

exports.get = function(req, res, next) {
  Exercise.find()
    .then(function(exercises){
      res.json(exercises);
    }, function(err){
      next(err);
    });
};

exports.getOne = function(req, res, next) {
  var exercise = req.exercise;
  res.json(exercise);
};

exports.put = function(req, res, next) {
  var exercise = req.exercise;

  var update = req.body;

  _.merge(exercise, update);

  exercise.save(function(err, saved) {
    if (err) {
      next(err);
    } else {
      res.json(saved);
    }
  })
};

exports.post = function(req, res, next) {
  var newexercise = req.body;

  Exercise.create(newexercise)
    .then(function(exercise) {
      res.json(exercise);
    }, function(err) {
      next(err);
    });
};

exports.delete = function(req, res, next) {
  req.exercise.remove(function(err, removed) {
    if (err) {
      next(err);
    } else {
      res.json(removed);
    }
  });
};
