# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

eh = Author.create(name: "Earnest Hemingway", deceased: true)
sk = Author.create(name: "Stephen King", deceased: false)
mt = Author.create(name: "Mark Twain", deceased: true)
cd = Author.create(name: "Charles Dickens", deceased: true)
jr = Author.create(name: "J. K. Rowling", deceased: false)
ws = Author.create(name: "William Shakespeare", deceased: true)
ja = Author.create(name: "Jane Austen", deceased: true)
jt = Author.create(name: "J. R. R. Tolkien", deceased: true)
js = Author.create(name: "John Steinbeck", deceased: true)

fiction = Genre.create(name: "Fiction")
poetry = Genre.create(name: "Poetry")
narrative = Genre.create(name: "Narrative")
nonfiction = Genre.create(name: "Non-fiction")
science_fiction = Genre.create(name: "Science Fiction")
short_story = Genre.create(name: "Short Story")
biography = Genre.create(name: "Biography")
autobiography = Genre.create(name: "Autobiography")
mythology = Genre.create(name: "Mythology")
play = Genre.create(name: "Play")
fantasy = Genre.create(name: "Fantasy")
novel = Genre.create(name: "Novel")
novella = Genre.create(name: "Novella")

Book.create(name: "A Christmas Carol", author_id: cd.id, genre_id: novella.id)
Book.create(name: "Pride and Prejudice", author_id: ja.id, genre_id: novel.id)
Book.create(name: "The Grapes of Wrath", author_id: js.id, genre_id: novel.id)
Book.create(name: "The Pearl", author_id: js.id, genre_id: novella.id)
Book.create(name: "A Christmas Carol", author_id: cd.id, genre_id: novella.id)