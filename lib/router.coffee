Router.configure
        layoutTemplate: 'layout'
        loadingTemplate: 'loading'
        waitOn: -> Meteor.subscribe 'posts'
        
Router.map ->
        @.route 'postsList', path: '/'
        @.route 'postPage',
                path: '/posts/:_id'
                data: -> Posts.findOne @.params._id
        @.route 'postSubmit',
                path: '/submit'

# Hook to check if the user is logged in
requireLogin = (pause) ->
        if not Meteor.user()
                @.render 'accessDenied'
                pause()
                                                 
Router.onBeforeAction 'loading'
Router.onBeforeAction requireLogin, only: 'postSubmit'
