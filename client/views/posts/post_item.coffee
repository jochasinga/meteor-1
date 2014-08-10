# Define the domain helper function
Template.postItem.helpers
  ownPost: ->
    @userId is Meteor.userId()

  domain: ->
    a = document.createElement 'a'
    a.href = @url
    a.hostname

  upvotedClass: ->
    userId = Meteor.userId()
    if userId and not _.include(@upvoters, userId)
      'btn-primary upvotable'
    else
      'disabled'

Template.postItem.events
  'click .upvotable': (e) ->
    e.preventDefault()
    Meteor.call 'upvote', @_id

