require 'rails_helper'

RSpec.describe AuthorBook, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it {should belong_to :book}
    it {should belong_to :author}
  end

  describe 'methods' do
  end
end
