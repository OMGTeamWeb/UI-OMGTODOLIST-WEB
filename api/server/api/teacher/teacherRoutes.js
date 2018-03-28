var router = require('express').Router();
var controller = require('./teacherController');

var auth = require('../../auth/auth');
var authController = require('../../auth/teacher/controller');

var checkSession = [auth.decodeToken(), authController.getUserData()];

// setup boilerplate route jsut to satisfy a request
// for building
router.param('id', controller.params);

// GET my teacher's info
router.get('/me', checkSession, controller.me);

// POST new teachers
router.route('/create')
  .post(controller.verifyTeacher(), controller.post)

// GET all teachers
router.route('/all')
	.get(controller.get)

// Teacher - Token status
router.get('/status', checkSession, controller.status);

// Sign in Teacher
router.post('/signin', authController.verifyUser(), authController.signin);

// GET, PUT and DELETE teachers
router.route('/:id')
  .get(controller.getOne)
  .put(controller.verifyUpdateTeacher(), controller.put) //check user
  .delete(controller.delete) //check user

module.exports = router;
