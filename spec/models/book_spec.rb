require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :publication_year}
    it {should validate_presence_of :pages}
  end

  describe 'relationships' do
    it {should have_many(:authors).through(:author_books)}
  end

  describe 'methods' do
    it "can return array of all author's names" do
      author_1 = Author.create!(name: "Robert Jordan")
      author_2 = Author.create!(name: "Brandon Sanderson")
      book = Book.create!(title: "A Memory of Light",
                          publication_year: 2013,
                          pages: 909)
      book.authors << [author_1, author_2]

      expect(book.author_names).to eq(["Robert Jordan", "Brandon Sanderson"])
    end
  end
end
