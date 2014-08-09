# Event handler for submit event
Template.postSubmit.events
  'submit form': (e) -> e.preventDefault()
   
  post = 
    url: $(e.target).find('[name=url]').val()
    title: $(e.target).find('[name=title]').val()
    message: $(e.target).find('[name=message]').val()

  # .call(methodName, postData, callback)
  Meteor.call('post', post, (error, id) ->
    if error
      alert(error.reason)
    else
      Router.go('postPage', _id: id)
  )
                
