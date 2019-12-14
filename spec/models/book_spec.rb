require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :publication_year}
    it {should validate_presence_of :pages}
  end

  describe 'relationships' do
    it {should have_many :authors}
  end

  describe 'methods' do
  end
end
