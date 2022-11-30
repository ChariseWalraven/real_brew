# real_brew

Final project for FlutterDevCamp 2022

The purpose of this app is to be a reference to help people who like brewing beers.

I made this app in a space of about 4 or 5 days due to schedule constraints.

Hopefully, this proves I have an understanding of the following topics:

- Basic UI
- State management with Riverpod (first time using)
- API integration
- Testing (unit)

Some things I would like to improve on in future that I noticed I was having trouble with in this app:

- More complex state management
  - Specifically I wanted to get an initial list of favourite beers from shared prefs or somewhere else and set that as the initial state of the favourites list, but didn't quite manage it.
- Refresh favourites automatically when a favourite is removed from the favourites screen
  - Somehow removing favourites doesn't trigger a build. I'm wondering if it's because I am using a ConsumerStatefulWidget to keep track of the UI for the favourites button and this is somehow interfering in the rest of he app?
- Animations
  - I was hoping to add some animations but decided to focus on getting the app working, and then my time ran out. Maybe it would be better to practice animations separately next time, then I don't have to worry about functionality.
- Widget tests
  - I ran into trouble with Widget testing so I left it out this time.