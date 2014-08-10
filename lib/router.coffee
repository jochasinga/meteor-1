Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: -> Meteor.subscribe 'notifications'

Router.map ->
  @route 'postPage',
    path: '/posts/:_id'
    waitOn: -> Meteor.subscribe 'comments', @params._id
    data: -> Posts.findOne @params._id

  @route 'postEdit',
    path: '/posts/:_id/edit',
    data: -> Posts.findOne @params._id

  @route 'postSubmit',
    path: '/submit'

  @route 'postsList',
    path: '/:postsLimit?'
    waitOn: ->
      limit = parseInt(@params.postsLimit) or 5

      Meteor.subscribe 'posts', {sort: {submitted: -1}, limit: limit}

    data: ->
      limit = parseInt(@params.postsLimit) or 5
      posts: Posts.find {}, {sort: {submitted: -1}, limit: limit}
        
# Hook to check if the user is logged in
requireLogin = (pause) ->
  unless  Meteor.user()
    if Meteor.loggingIn()
      @render 'loading'
    else
      @render 'accessDenied'
    pause()
                                
Router.onBeforeAction requireLogin, {only: 'postSubmit'}
Router.onBeforeAction( -> clearErrors())
