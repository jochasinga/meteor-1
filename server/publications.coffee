# Publish all posts to the client
Meteor.publish 'posts', -> Posts.find()

# Publish all comments to the client
Meteor.publish 'comments', -> Comments.find()
