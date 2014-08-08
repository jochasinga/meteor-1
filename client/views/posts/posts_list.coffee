# Populate posts with mock data postsData
postsData = [
  {
    title: "Introducting Telescope"
    author: "Sacha Grief"
    url: "http://sachagrief.com/introducing-telescope/"
  }
  {
    title: "Meteor"
    author: "Tom Coleman"
    url: "http://meteor.com"
  }
  {
    title: "The Meteor Book"
    author: "Tom Coleman"
    url: "http://themeteorbook.com"
  }
]
# Specify posts helper
Template.postsList.helpers posts: postsData