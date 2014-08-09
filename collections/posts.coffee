# Instantiate a new Collection name `Posts`.
# Since Coffeescript implicitly adds `var` to  every variable,
# and in Meteor, `var` keyword limits the scope of an object
# to the current file. Here, we want our Posts Collection available
# to the whole app, which is why we're using this pattern to define
# a global variable in Coffeescript.

exports = this
exports.Posts = new Meteor.Collection('posts')

Meteor.methods
        post: (postAttributes) ->
                user = Meteor.user()
                postWithSameLink = Posts.findOne(url: postAttributes.url)

                # ensure the user is logged in
                throw new Meteor.Error(401, "You need to login to post new stories") unless user
                # ensure the post has a title
                throw new Meteor.Error(422, "Please fill in a headline") unless postAttributes.title
                # check that there are no previous post with same link
                throw new Meteor.Error(302, "This link has already been posted", postWithSameLink._id) if postAttributes.url and postWithSameLink

                # pick out the whitelisted keys
                post = _.extend(_.pick(postAttributes, 'url', 'title', 'message'),
                        userId: user._id
                        author: user.username
                        submitted: new Date().getTime()
                )

                postId = Posts.insert(post)
                return postId
                                
