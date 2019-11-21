# Rails Project Library
This application is designed to mimic a library. There are two types of user, standard and librarian. A librarian can add books to the library and edit books that currently exist in the library. They can also add/edit genres and authors. Standard users can view books, check out books, and check in books. There is also integrated authentication with Google. A video demo can be found here: https://youtu.be/PVwEzerZMgE


# Notes
Ruby version = 2.5.1

# Instructions
- Run `bundle install`
- Run `rails db:migrate`
- If you would like to load with books, authors and genres run `rails db:seed`
- Finally run `rails s` and browse to localhost:3000