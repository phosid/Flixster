# FLiXSTER

Flixster is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flixster Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [x] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

## Flixster Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.
- [x] Added rating and date released into details page.
- [x] Made text scrollable in details page.

### App Walkthrough GIF
<img src="http://g.recordit.co/VpdEb13u2R.gif" width=250><br>
<img src="http://g.recordit.co/rpSHZJnobM.gif" width=250><br>

### Notes
Some challenges I faced while building the app:
- I forgot to rename the view controllers after creating them so identifying them would be hard.
- For some labels I created, I forgot to create the corresponding outlet for it.
- Getting the API endpoint that I wanted for my "favorites" tab view required some research into the movie database API documentation.
- Working with WebView was very new to me, so I consulted a lot of the Apple Developer documentation and played around with loading basic pages first, then delved into getting the required endpoint to load the youtube trailer.
- When I first created the grid view, I ran into a problem where my poster images were very small, and it turns out that was an easy fix when I changed "Estimate Size" to None.
- Messing around with auto layout was a challenge for me, but after reading a few documents and watching a few videos, I added some constraints, but I'm pretty sure there's something messed up about it still.

### Things to improve on:
- To view the youtube trailer, a user had to click on the poster only for the table view. If a user clicked on a poster in the details page from a grid view, nothing would pop up. Implementing that would make the app more uniform.
- I also think improving the auto layout features would make things better placed on other devices.

### How to run the application: 
- I used Cocoapods to set the images using the AlamofireImage library. Thus, when you download the files, you will have to run the app by clicking on "flixster.xcworkspace".
