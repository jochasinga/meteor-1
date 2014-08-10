Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: -> Meteor.subscribe 'notifications'

PostsListController = RouteController.extend
  template: 'postsList'
  increment: 5
  limit: ->
    parseInt(@params.postsLimit) or @increment
  findOptions: ->
    sort: { submitted: -1 }
    limit: @limit()
  waitOn: ->
    Meteor.subscribe 'posts', @findOptions()
  posts: ->
    Posts.find {}, @findOptions()
  data: ->
    hasMore = @posts().count() is @limit()
    nextPath = @route.path {postsLimit: @limit() + @increment}

    {posts: @posts(), nextPath: if hasMore then nextPath else null}
   
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
    disableProgress: true

  @route 'postsList',
    path: '/:postsLimit?'
    controller: PostsListController
        
# Hook to check if the user is logged in
requireLogin = (pause) ->
  unless  Meteor.user()
    if Meteor.loggingIn()
      @render 'loading'
    else
      @render 'accessDenied'
    pause()
                                
Router.onBeforeAction requireLogin, {only: 'postSubmit'}
Router.onBeforeAction  -> clearErrors()
