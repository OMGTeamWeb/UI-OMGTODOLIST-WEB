var router = require('express').Router();
var controller = require('./attemptController');

// Get ID information when using /:id route
router.param('id', controller.params);


// POST new attempts
router.route('/create')
  .post(controller.post)

// GET all attempts
router.route('/all')
  .get(controller.get)

// GET, PUT and DELETE attempts
router.route('/:id')
  .get(controller.getOne)
  .put(controller.put)
  .delete(controller.delete)

module.exports = router;
