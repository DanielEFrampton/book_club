require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many(:books).through(:author_books)}
  end

  describe 'class methods' do
    describe 'author_pages' do
      it "can return average number of pages of all author's books" do
        jordan = Author.create!(name: "Robert Jordan")
        sanderson = Author.create!(name: "Brandon Sanderson")
        book_1 = Book.create!(title: "A Memory of Light",
                            publication_year: 2013,
                            pages: 909)
        book_1.authors << [jordan, sanderson]
        book_2 = jordan.books.create!(title: "The Eye of the World",
                            publication_year: 1990,
                            pages: 685)

        expect(jordan.average_pages).to eq(797)
        expect(sanderson.average_pages).to eq(909)
      end
    end
  end
end
