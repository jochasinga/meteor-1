# Specify posts helper function, which
# return all the post objects found 
Template.postsList.helpers
  # Mongo's `sort` operator sorting DESC or ASC
  posts: -> Posts.find {}, sort: {submitted: -1}
