# Publish all posts to the client
Meteor.publish 'posts', (options) ->
  Posts.find {}, options

Meteor.publish 'singlePost', (id) ->
  id and Posts.find id

# Publish all comments to the client
Meteor.publish 'comments', (postId) ->
  Comments.find { postId: postId }

Meteor.publish 'notifications', ->
  Notifications.find { userId: @userId } 
