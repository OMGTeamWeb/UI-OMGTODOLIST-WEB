var router = require('express').Router();
var controller = require('./methodController');

// Get ID information when using /:id route
router.param('id', controller.params);


// POST new methods
router.route('/create')
  .post(controller.post)

// GET all methods
router.route('/all')
  .get(controller.get)

// GET, PUT and DELETE methods
router.route('/:id')
  .get(controller.getOne)
  .put(controller.put)
  .delete(controller.delete)

module.exports = router;
