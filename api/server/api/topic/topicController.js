var Topic = require('./topicModel');
var _ = require('lodash');

exports.params = function(req, res, next, id) {
  Topic.findById(id)
    .then(function(topic) {
      if (!topic) {
        next(new Error('There is no topic with that id'));
      } else {
        req.topic = topic;
        next();
      }
    }, function(err) {
      next(err);
    });
};

exports.get = function(req, res, next) {
  Topic.find()
    .then(function(topics){
      res.json(topics);
    }, function(err){
      next(err);
    });
};

exports.getOne = function(req, res, next) {
  var topic = req.topic;
  res.json(topic);
};

exports.put = function(req, res, next) {
  var topic = req.topic;

  var update = req.body;

  _.merge(topic, update);

  topic.save(function(err, saved) {
    if (err) {
      next(err);
    } else {
      res.json(saved);
    }
  })
};

exports.post = function(req, res, next) {
  var newtopic = req.body;

  Topic.create(newtopic)
    .then(function(topic) {
      res.json(topic);
    }, function(err) {
      next(err);
    });
};

exports.delete = function(req, res, next) {
  req.topic.remove(function(err, removed) {
    if (err) {
      next(err);
    } else {
      res.json(removed);
    }
  });
};
