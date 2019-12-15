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
    @jordan = Author.create!(name: "Robert Jordan")
    @sanderson = Author.create!(name: "Brandon Sanderson")
    @book_5 = Book.create!(title: "A Memory of Light",
                        publication_year: 2013,
                        pages: 909)
    @book_5.authors << [@jordan, @sanderson]
    @book_6 = @jordan.books.create!(title: "The Eye of the World",
                        publication_year: 1990,
                        pages: 685)
  end

  describe 'When I visit the Book Index Page' do
    it "I see each author's name is a link" do
      visit '/books'

      expect(page).to have_content(@sendak.name, count: 2)
      expect(page).to have_link(@sendak.name, href: "/authors/#{@sendak.id}", count: 2)
      expect(page).to have_content(@seuss.name, count: 2)
      expect(page).to have_link(@seuss.name, href: "/authors/#{@seuss.id}", count: 2)
      expect(page).to have_content(@jordan.name, count: 2)
      expect(page).to have_link(@jordan.name, href: "/authors/#{@jordan.id}", count: 2)
      expect(page).to have_content(@sanderson.name, count: 1)
      expect(page).to have_link(@sanderson.name, href: "/authors/#{@sanderson.id}", count: 1)
    end
  end
  describe 'When I click the link' do
    it 'I am taken to an Author Show Page with name, title of books, and avg. pages of that author' do
      visit '/books'

      within "#book-#{@book_1.id}" do
        click_on @sendak.name
      end

      expect(current_path).to eq("/authors/#{@sendak.id}")
      expect(page).to have_content("Name: #{@sendak.name}")
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content("Average Number of Pages Per Book: 40")

      visit '/books'

      within "#book-#{@book_3.id}" do
        click_on @seuss.name
      end

      expect(current_path).to eq("/authors/#{@seuss.id}")
      expect(page).to have_content("Name: #{@seuss.name}")
      expect(page).to have_content(@book_3.title)
      expect(page).to have_content(@book_4.title)
      expect(page).to have_content("Average Number of Pages Per Book: 40")

      visit '/books'

      within "#book-#{@book_5.id}" do
        click_on @jordan.name
      end

      expect(current_path).to eq("/authors/#{@jordan.id}")
      expect(page).to have_content("Name: #{@jordan.name}")
      expect(page).to have_content(@book_5.title)
      expect(page).to have_content(@book_6.title)
      expect(page).to have_content("Average Number of Pages Per Book: 797")

      visit '/books'

      within "#book-#{@book_5.id}" do
        click_on @sanderson.name
      end

      expect(current_path).to eq("/authors/#{@sanderson.id}")
      expect(page).to have_content("Name: #{@sanderson.name}")
      expect(page).to have_content(@book_5.title)
      expect(page).to have_content("Average Number of Pages Per Book: 909")
    end
  end
end
