var Student = require('./studentModel');
var Group = require('../group/groupModel');
var Topic = require('../topic/topicModel');
var _ = require('lodash');
var signToken = require('../../auth/auth').signToken;

exports.params = function(req, res, next, id) {
  Student.findById(id)
  .then(function(user) {
    if (!user) {
      next(new Error('There is no student with that ID'));
    } else {
      req.user = user;
      next();
    }
  }, function(err) {
    next(err);
  });
};

exports.paramsGroup = function(req, res, next, groupid) {
  Group.findById(groupid)
  .then(function(group) {
    if (!group) {
      next(new Error('There is no group with that ID'));
    } else {
      req.group = group;
      next();
    }
  }, function(err) {
    next(err);
  });
};

exports.paramsTopic = function(req, res, next, topicid) {
  Topic.findById(topicid)
  .then(function(topic) {
    if (!topic) {
      next(new Error('There is no topic with that ID'));
    } else {
      req.topic = topic;
      next();
    }
  }, function(err) {
    next(err);
  });
};

exports.postTopic = function(req, res, next) {
  console.log("Student ID: " + req.user._id)
  console.log("Topic: " + req.topic._id)
  Student.findOneAndUpdate({ _id: req.user._id }, { $push: { topics: req.topic._id }}, function(err, data){
    if(err) {
      res.status(500).send('¡Hubo al insertar este Topic en el estudiante!');
    }
    res.json(data);
  });
};

exports.deleteTopic = function(req, res, next) {
  console.log("Student ID: " + req.user._id)
  console.log("Topic: " + req.topic._id)
  Student.findOneAndUpdate({ _id: req.user._id }, { $pull: { topics: req.topic._id }}, function(err, data){
    if(err) {
      res.status(500).send('¡Hubo al borrar este Topic del estudiante!');
    }
    res.json(data);

  });
};

exports.get = function(req, res, next) {
  Student.find()
  .then(function(users){
    res.json(users.map(function(user){
      return user.toJson();
    }));
  }, function(err){
    next(err);
  });
};

exports.getOne = function(req, res, next) {
  var user = req.user;
  res.json(user.toJson());
};

exports.put = function(req, res, next) {
  var user = req.user;

  var update = req.body;

  _.merge(user, update);

  user.save(function(err, saved) {
    if (err) {
      next(err);
    } else {
      res.json(user.toJson());
    }
  })
};

exports.post = function(req, res, next) {
  var newStudent = new Student(req.body);

  newStudent.save(function(err, user) {
    if(err) { return next(err);}

    var token = signToken(user._id);
    res.json({status: "success", token: token});
  });
};

exports.delete = function(req, res, next) {
  req.user.remove(function(err, removed) {
    if (err) {
      next(err);
    } else {
      res.json(removed.toJson());
    }
  });
};

exports.me = function(req, res) {
  res.json(req.user.toJson());
};

exports.status = function(req, res) {
  res.json({
    data: req.user.toJson(),
    status: 'success'
  });
};

// Function to obtain all student in
// an specific group

exports.getByGroup = function(req, res) {
  Student.find({ groupID: req.group.id })
  .then(function(users){
    res.json(users.map(function(user){
      return user.toJson();
    }));
  }, function(err){
    next(err);
  });
};

// Custom Functions //

// Verify unique listNo per group when
// creating a new student
exports.verifyStudent = function() {
  return function(req, res, next) {
    var age = req.body.age;
    var groupID = req.body.groupID;
    var listNo = req.body.listNo;
    var name = req.body.name;
    var sex = req.body.sex;

    if (!age || !groupID || !listNo || !name || !sex) {
      res.status(400).send('¡Hubo un error al añadir al estudiante! Verifique que no exista ningún campo vacío.');
      return;
    }

    Student.findOne({groupID: groupID, listNo: listNo})
    .then(function(user) {
      if (user) {
        res.status(400).send('¡Ya existe un estudiante dado de alta con el número de lista: "' + listNo + '"!');
      } else {
        req.user = user;
        next();
      }
    }, function(err) {
      next(err);
    });
  };
};

// Verify unique listNo when updating student

exports.verifyUpdateStudent = function() {
  return function(req, res, next) {
    var currentID = req.user.id;

    var age = req.body.age;
    var groupID = req.body.groupID;
    var listNo = req.body.listNo;
    var name = req.body.name;
    var sex = req.body.sex;

    if (!age || !groupID || !listNo || !name || !sex) {
      res.status(400).send('¡Hubo un error al añadir al estudiante! Verifique que no exista ningún campo vacío.');
      return;
    }

    Student.findOne({ groupID: groupID, listNo: listNo })
    .then(function(user) {
      if (user) {
        if (user._id != currentID) {
          res.status(400).send('¡Ya está asignado este número de lista a otro estudiante, intenta con uno diferente!');
        } else {
          next();
        }
      } else {
        next();
      }
    }, function(err) {
      next(err);
    });
  };
};
