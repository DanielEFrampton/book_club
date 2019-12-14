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
  end

  describe "When I visit '/books'" do
    it "Then I see each book in the system including the book's title, pages, year, author name(s)" do
      visit '/books'

      within "#book-#{@book_1.id}" do
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.pages)
        expect(page).to have_content(@book_1.publication_year)
        expect(page).to have_content(@book_1.author.name)
      end
      
      within "#book-#{@book_2.id}" do
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(@book_2.pages)
        expect(page).to have_content(@book_2.publication_year)
        expect(page).to have_content(@book_2.author.name)
      end

      within "#book-#{@book_3.id}" do
        expect(page).to have_content(@book_3.title)
        expect(page).to have_content(@book_3.pages)
        expect(page).to have_content(@book_3.publication_year)
        expect(page).to have_content(@book_3.author.name)
      end

      within "#book-#{@book_4.id}" do
        expect(page).to have_content(@book_4.title)
        expect(page).to have_content(@book_4.pages)
        expect(page).to have_content(@book_4.publication_year)
        expect(page).to have_content(@book_4.author.name)
      end
    end
  end
end
