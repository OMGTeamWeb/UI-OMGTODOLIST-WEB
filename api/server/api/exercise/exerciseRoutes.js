var router = require('express').Router();
var controller = require('./exerciseController');

// Get ID information when using /:id route
router.param('id', controller.params);


// POST new exercises
router.route('/create')
  .post(controller.post)

// GET all exercises
router.route('/all')
  .get(controller.get)

// GET, PUT and DELETE exercises
router.route('/:id')
  .get(controller.getOne)
  .put(controller.put)
  .delete(controller.delete)

module.exports = router;
