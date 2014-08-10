Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: ->
    [
      Meteor.subscribe 'posts'
      Meteor.subscribe 'notifications'
    ] 

Router.map ->
  @route 'postsList', path: '/'

  @route 'postPage',
    path: '/posts/:_id'
    waitOn: -> Meteor.subscribe 'comments', @params._id
    data: -> Posts.findOne @params._id


  @route 'postEdit',
    path: '/posts/:_id/edit',
    data: -> Posts.findOne @params._id

  @route 'postSubmit',
    path: '/submit'
    
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
