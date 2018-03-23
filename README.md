# README

## About This App:
** Jindle is a small book app that functions similarly to a Kindle, with the added bonus of allowing users to create books rather than simply reading them **

###Challenges with creating Jindle:
* The app was meant to be created within 5 days. Most of the time was spent debugging and fixing tests that were red. Tests were written prior to building new features in order to cover potential use cases.

* There were features that I would have liked to build out further. User authentication with the devise gem is not fully functional. Additionally once users log in to create their books, they should be able to create books. In order to create valid books I want to add validations so that users can't fill in the fields with strange characters such as spaces, weird characters, a numbers only, etc, and then save the books into their libraries. Instead they shold get alerts within the same field that lets them know that weird characters (anything outside from leaving the field blank) are not acceptable within those fields.

* Finally, the last features I will add is to allow authenticated users to view all of their created books, update any books, and delete any books.
