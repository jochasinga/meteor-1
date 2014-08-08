# Instantiate a new Collection name `Posts`.
# Since Coffeescript implicitly adds `var` to  every variable,
# and in Meteor, `var` keyword limits the scope of an object
# to the current file. Here, we want our Posts Collection available
# to the whole app, which is why we're using this pattern to define
# a global variable in Coffeescript.

exports = this
exports.Posts = new Meteor.Collection 'posts'

Posts.allow insert: (userId, doc) -> return !! userId
