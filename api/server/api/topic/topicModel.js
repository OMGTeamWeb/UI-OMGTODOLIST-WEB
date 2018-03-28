var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var topicSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  exercises: [{
    type: Schema.Types.ObjectId,
    ref: 'exercise'
  }]
});

module.exports = mongoose.model('topic', topicSchema);
