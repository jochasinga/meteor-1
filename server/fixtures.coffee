# Load up three posts whenever the server starts
# and finds the `Posts` collection empty:

if Posts.find().count() is 0
        Posts.insert
                title: 'Introducing Telelescope'
                author: 'Sacha Greif'
                url: 'http://sachagreif.com/introducing-telescope/'

        Posts.insert
                title: 'Meteor'
                author: 'Tome Coleman'
                url: 'http://meteor.com'

        Posts.insert
                title: 'The Meteor Book'
                author: 'Tom Coleman'
                url: 'http://themeteorbook.com'
