# Instantiate a new Collection name `Posts`.
# Since Coffeescript implicitly adds `var` to  every variable,
# and in Meteor, `var` keyword limits the scope of an object
# to the current file. Here, we want our Posts Collection available
# to the whole app, which is why we're using this pattern to define
# a global variable in Coffeescript.

exports = this
exports.Posts = new Meteor.Collection 'posts'

Posts.allow
  update: ownsDocument
  remove: ownsDocument

Meteor.methods
  post: (postAttributes) ->
    user = Meteor.user()
    postWithSameLink = Posts.findOne(url: postAttributes.url)

    # ensure the user is logged in
    unless user
      throw new Meteor.Error 401, "You need to login to post new stories"

     # ensure the post has a title
    unless postAttributes.title
      throw new Meteor.Error 422, "Please fill in a headline"

    # check that there are no previous post with same link
    if postAttributes.url and postWithSameLink
      throw new Meteor.Error 302, "This link has already been posted", postWithSameLink._id

    # pick out the whitelisted keys
    post = _.extend _.pick(postAttributes, 'url', 'title', 'message'),
      userId: user._id
      author: user.username
      submitted: new Date().getTime()

    postId = Posts.insert(post)
                                
