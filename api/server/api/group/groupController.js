var Group = require('./groupModel');
var _ = require('lodash');

exports.params = function(req, res, next, id) {
  Group.findById(id)
    .then(function(group) {
      if (!group) {
        next(new Error('There is no group with that id'));
      } else {
        req.group = group;
        next();
      }
    }, function(err) {
      next(err);
    });
};

exports.get = function(req, res, next) {
  Group.find()
    .then(function(groups){
      res.json(groups);
    }, function(err){
      next(err);
    });
};

exports.getOne = function(req, res, next) {
  var group = req.group;
  res.json(group);
};

exports.put = function(req, res, next) {
  var group = req.group;

  var update = req.body;

  _.merge(group, update);

  group.save(function(err, saved) {
    if (err) {
      next(err);
    } else {
      res.json(saved);
    }
  })
};

exports.post = function(req, res, next) {
  var newgroup = req.body;

  Group.create(newgroup)
    .then(function(group) {
      res.json(group);
    }, function(err) {
      next(err);
    });
};

exports.delete = function(req, res, next) {
  req.group.remove(function(err, removed) {
    if (err) {
      next(err);
    } else {
      res.json(removed);
    }
  });
};
