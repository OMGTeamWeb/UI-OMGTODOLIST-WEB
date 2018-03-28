var Student = require('../../api/student/studentModel');
var signToken = require('../auth').signToken;

// Sign In first function

exports.verifyUser = function() {
  return function(req, res, next) {
    var groupID = req.body.groupID;
    var listNo = req.body.listNo;
    if (!groupID || !listNo) {
      res.status(400).send('¡Necesitas seleccionar un grupo y un número de lista!');
      return;
    }
    Student.findOne({groupID: groupID, listNo: listNo})
      .then(function(user) {
        if (!user) {
          res.status(401).send('¡No existe ningún estudiante con ese grupo y grado!');
        } else {
          req.user = user;
          next();
        }
      }, function(err) {
        next(err);
      });
  };
};

// Sign In second function

exports.signin = function(req, res, next) {
  // req.user will be there from the middleware
  // verify user. Then we can just create a token
  // and send it back for the client to consume
  var token = signToken(req.user._id);
  res.json({token: token});
};

// Check session second function

exports.getUserData = function() {
  return function(req, res, next) {
    Student.findById(req.user._id)
      .then(function(user) {
        if (!user) {
          // if no user is found it was not
          // it was a valid JWT but didn't decode
          // to a real user in our DB. Either the user was deleted
          // since the client got the JWT, or
          // it was a JWT from some other source
          res.status(401).send('Unauthorized');
        } else {
          // update req.user with fresh user from
          // stale token data
          req.user = user;
          next();
        }
      }, function(err) {
        next(err);
      });
  }
};

// Check Student's group permissions

exports.validateGroup = function() {
  return function(req, res, next) {
    var userGroup = req.user.groupID
    var groupID = req.params.id
    console.log(userGroup)
    console.log(groupID)
    if (userGroup.equals(groupID)) {
      next();
    } else {
      res.status(401).send('Unauthorized');
    }
  }
};