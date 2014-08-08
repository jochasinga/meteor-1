# Event handler for submit event

Template.postSubmit.events
        'submit form': (e) ->
                e.preventDefault()
                # jQuery targetting the post fields
                post = 
                        url: $(e.target).find('[name=url]').val()
                        title: $(e.target).find('[name=title]').val()
                        message: $(e.target).find('[name=message]').val()

                # .call(methodName, postData, callback)
                Meteor.call 'post', post, (error, id) ->
                        if error
                                return alert error.reason
                        Router.go 'postPage', _id: id
                        return 
                
