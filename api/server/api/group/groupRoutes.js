var router = require('express').Router();
var controller = require('./groupController');

var auth = require('../../auth/auth');
var authController = require('../../auth/teacher/controller');

var checkUser = [auth.decodeToken(), authController.getUserData()];

// Get ID information when using /:id route
router.param('id', controller.params);


// POST new groups
router.route('/create')
  .post(controller.post)

// GET all groups
router.route('/all')
  .get(controller.get)

// GET, PUT and DELETE groups
router.route('/:id')
  .get(controller.getOne)
  .put(controller.put)
  .delete(controller.delete)

module.exports = router;
