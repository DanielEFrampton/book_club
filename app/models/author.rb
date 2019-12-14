class Author < ApplicationRecord
  validates_presence_of :name
  has_many :books, through: :author_books
  
end
