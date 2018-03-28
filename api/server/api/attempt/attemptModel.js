var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var attemptSchema = new Schema({
  studentID: {
    type: Schema.Types.ObjectId,
    ref: 'student',
    required: true
  },
  exerciseID: {
    type: Schema.Types.ObjectId,
    ref: 'exercise',
    required: true
  },
  methodID: {
    type: Schema.Types.ObjectId,
    ref: 'method',
    required: true
  },
  status: {
    type: Number,
    required: true
  },
  level: {
    type: String,
    required: true
  },
  time: {
    type: Number,
    required: true
  }
}, { timestamps: true }
);

module.exports = mongoose.model('attempt', attemptSchema);
