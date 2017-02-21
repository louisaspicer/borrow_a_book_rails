class Book < ApplicationRecord

  validates :title, length: { minimum: 2 }, uniqueness: true

  has_many :comments, dependent: :destroy

end
