# Specify posts helper function, which
# return all the post objects found 
Template.postsList.helpers posts: ->
        return Posts.find()
