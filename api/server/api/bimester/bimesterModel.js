var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var bimesterSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  topics: [{
    name: { type: String },
    id: {type: String }
  }]
});

module.exports = mongoose.model('bimester', bimesterSchema);
