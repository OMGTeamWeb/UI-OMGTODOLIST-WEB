var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var exerciseSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  video: {
    type: String,
    required: true
  },
  canvasFile: {
    type: String,
    required: true
  },
  methods: [{
    type: Schema.Types.ObjectId,
    ref: 'method'
  }]
});

module.exports = mongoose.model('exercise', exerciseSchema);
