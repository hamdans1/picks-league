# The Picks League Project

My friends and I have done our preseason Over/Under picks for the major sports leagues on a series of spreadsheets for years.
Well this year I decided to set up a web application using Rails that could do the work of tracking our picks, both currently and historically <br>
<br>
## Mapping the Data Structure
My first crack at this got messy because I did a poor job mapping out the data structure. I re-organized everything so that I could build out properly this time. I started with League-Team-Player models which are all interrelated. Then used Devise for Users. Finally I built out the Competition and Sheet models which are the centerpieces of the application.
<br>
## Using Devise for Users
I decided to skip designing a custom User scaffolding in lieu of using the Devise gem. Devise covers all the necessary views and models I might need with an excellent library to boot.
<br>
## The Team Model
I debated how to best implement the team/player/league data structure. I decided to use the Team as the central data model, and store the players as an array (Thanks PostGres) and the league and coaches as strings.
<br>
## The Sheet Model
Every instance of a 'sheet' contains a user's picks and is essentially an entry into different competitions. To play, you build a sheet!
<br>

