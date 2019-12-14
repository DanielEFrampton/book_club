require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  before(:each) do
    @sendak = Author.create!(name: "Maurice Sendak")
    @book_1 = @sendak.books.create!(title: "Where the Wild Things Are",
                    publication_year: 1963,
                    pages: 40)
    @book_2 = @sendak.books.create!(title: "In the Night Kitchen",
                    publication_year: 1970,
                    pages: 40)
    @seuss = Author.create!(name: "Theodore Seuss Geisel")
    @book_3 = @seuss.books.create!( title: "And to Think That I Saw It On Mulberry Street",
                                    publication_year: 1937,
                                    pages: 32)
    @book_4 = @seuss.books.create!( title: "Bartholomew and the Oobleck",
                                    publication_year: 1949,
                                    pages: 48)
    @author_3 = Author.create!(name: "Robert Jordan")
    @author_4 = Author.create!(name: "Brandon Sanderson")
    @book_5 = Book.create!(title: "A Memory of Light",
                        publication_year: 2013,
                        pages: 909)
    @book_5.authors << [@author_3, @author_4]
  end

  describe "When I visit '/books'" do
    it "Then I see each book in the system including the book's title, pages, year, author name(s)" do
      visit '/books'

      within "#book-#{@book_1.id}" do
        expect(page).to have_content("Title: #{@book_1.title}")
        expect(page).to have_content("Pages: #{@book_1.pages}")
        expect(page).to have_content("Publication Year: #{@book_1.publication_year}")
        expect(page).to have_content("Author: #{@sendak.name}")
      end

      within "#book-#{@book_2.id}" do
        expect(page).to have_content("Title: #{@book_2.title}")
        expect(page).to have_content("Pages: #{@book_2.pages}")
        expect(page).to have_content("Publication Year: #{@book_2.publication_year}")
        expect(page).to have_content("Author: #{@sendak.name}")
      end

      within "#book-#{@book_3.id}" do
        expect(page).to have_content("Title: #{@book_3.title}")
        expect(page).to have_content("Pages: #{@book_3.pages}")
        expect(page).to have_content("Publication Year: #{@book_3.publication_year}")
        expect(page).to have_content("Author: #{@seuss.name}")
      end

      within "#book-#{@book_4.id}" do
        expect(page).to have_content("Title: #{@book_4.title}")
        expect(page).to have_content("Pages: #{@book_4.pages}")
        expect(page).to have_content("Publication Year: #{@book_4.publication_year}")
        expect(page).to have_content("Author: #{@seuss.name}")
      end

      within "#book-#{@book_5.id}" do
        expect(page).to have_content("Title: #{@book_5.title}")
        expect(page).to have_content("Pages: #{@book_5.pages}")
        expect(page).to have_content("Publication Year: #{@book_5.publication_year}")
        expect(page).to have_content("Authors: #{@author_3.name}, #{@author_4.name}")
      end
    end
  end
end
