# Publish all posts to the client
Meteor.publish 'posts', -> Posts.find()
