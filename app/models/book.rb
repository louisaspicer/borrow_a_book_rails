class Book < ApplicationRecord

  validates :title, length: { minimum: 2 }, uniqueness: true

  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "placeholder.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

end
