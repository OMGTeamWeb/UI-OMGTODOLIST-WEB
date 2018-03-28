var router = require('express').Router();
var controller = require('./studentController');

var auth = require('../../auth/auth');
var authController = require('../../auth/student/controller');

var checkSession = [auth.decodeToken(), authController.getUserData()];
var signInUser = [authController.verifyUser(), authController.signin];

// setup boilerplate route just to satisfy a request for building
router.param('id', controller.params);
router.param('groupid', controller.paramsGroup);
router.param('topicid', controller.paramsTopic);

// GET my student's info
router.get('/me', checkSession, controller.me);

// POST students
router.route('/create')
  .post(controller.verifyStudent(), controller.post)

// GET all students
router.route('/all')
	.get(controller.get)

// POST / DELETE topics for each student
router.route('/:id/topic/:topicid')
	.delete(controller.deleteTopic)
	.post(controller.postTopic)

// Student - Token status
router.get('/status', checkSession, controller.status);

// GET students by Group
router.route('/group/:groupid')
	.get(controller.getByGroup)

// GET, PUT and DELETE students
router.route('/:id')
  .get(controller.getOne)
  .put(controller.verifyUpdateStudent(), controller.put) //check user
  .delete(controller.delete) //check user

// Sign in students
router.post('/signin', signInUser);

module.exports = router;
