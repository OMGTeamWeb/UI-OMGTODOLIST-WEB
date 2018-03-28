var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var bcrypt = require('bcrypt');

var studentSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  // birthDate: { // auth parameter DD-MM-YYYY
  //   type: String,
  //   minlength: 10,
  //   maxlength: 10,
  //   required: true
  // },
  listNo: { // auth parameter
    type: Number,
    required: true
  },
  groupID: {
    type: Schema.Types.ObjectId,
    ref: 'group',
    required: true
  },
  sex: { // M | F
    type: String,
    minlength: 1,
    maxlength: 1,
    required: true
  },
  age: {
    type: Number,
    required: true
  },
  description: {
    type: String
  },
  topics: [{
    type: Schema.Types.ObjectId, ref: 'topic'
  }]
}, { timestamps: true }
);

// studentSchema.pre('save', function(next) {
//   if (!this.isModified('password')) return next();

//   this.password = this.encryptPassword(this.password);
//   next();
// })

studentSchema.methods = {
  // check the passwords on signin
  authenticate: function(plainPassword) {
    return bcrypt.compareSync(plainPassword, this.password);
  },
  // hash the passwords
  encryptPassword: function(plainPassword) {
    if (!plainPassword) {
      return ''
    } else {
      var salt = bcrypt.genSaltSync(10);
      return bcrypt.hashSync(plainPassword, salt);
    }
  },

  toJson: function() {
    var obj = this.toObject()
    return obj;
  }
};


module.exports = mongoose.model('student', studentSchema);
