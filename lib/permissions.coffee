# check that the userId specified owns the documents
exports = this
exports.ownsDocument = (userId, doc) ->
  doc and doc.userId is userId
