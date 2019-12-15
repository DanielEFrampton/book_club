# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sendak = Author.create!(name: "Maurice Sendak")
book_1 = sendak.books.create!(title: "Where the Wild Things Are",
                publication_year: 1963,
                pages: 40)
book_2 = sendak.books.create!(title: "In the Night Kitchen",
                publication_year: 1970,
                pages: 40)
seuss = Author.create!(name: "Theodore Seuss Geisel")
book_3 = seuss.books.create!( title: "And to Think That I Saw It On Mulberry Street",
                                publication_year: 1937,
                                pages: 32)
book_4 = seuss.books.create!( title: "Bartholomew and the Oobleck",
                                publication_year: 1949,
                                pages: 48)
author_3 = Author.create!(name: "Robert Jordan")
author_4 = Author.create!(name: "Brandon Sanderson")
book_5 = Book.create!(title: "A Memory of Light",
                    publication_year: 2013,
                    pages: 909)
book_5.authors << [author_3, author_4]
book_6 = author_3.books.create!(title: "The Eye of the World",
                    publication_year: 1990,
                    pages: 685)
