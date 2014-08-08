# Specify posts helper function, which
# return all the post objects found 
Template.postsList.helpers
        posts: ->
                # Mongo's `sort` operator sorting DESC or ASC
                return Posts.find {}, {sort: {submitted: -1}}
