# Local (client-only) collection
exports = this
exports.Errors = new Meteor.Collection null

exports.throwError = (message) ->
  Errors.insert {message: message, seen: false}

exports.clearErrors = ->
  Errors.remove {seen: true}
