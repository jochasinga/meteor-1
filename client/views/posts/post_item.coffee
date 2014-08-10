# Define the domain helper function
Template.postItem.helpers
  ownPost: ->
    @userId is Meteor.userId()

  domain: ->
    a = document.createElement 'a'
    a.href = @url
    a.hostname

Template.postItem.events
  'click .upvote': (e) ->
    e.preventDefault()
    Meteor.call 'upvote', @_id

