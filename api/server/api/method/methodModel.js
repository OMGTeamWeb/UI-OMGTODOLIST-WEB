var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var methodSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  video: {
    type: String,
    required: true
  },
  exerciseID: {
    type: Schema.Types.ObjectId,
    ref: 'exercise'
  }
});

module.exports = mongoose.model('method', methodSchema);
