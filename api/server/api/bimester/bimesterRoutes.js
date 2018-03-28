var router = require('express').Router();
var controller = require('./bimesterController');

// Get ID information when using /:id route
router.param('id', controller.params);


// POST new bimesters
router.route('/create')
  .post(controller.post)

// GET all bimesters
router.route('/all')
  .get(controller.get)

// GET, PUT and DELETE groups
router.route('/:id')
  .get(controller.getOne)
  .put(controller.put)
  .delete(controller.delete)

module.exports = router;
