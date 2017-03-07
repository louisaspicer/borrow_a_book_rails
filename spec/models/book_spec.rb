require 'rails_helper'

describe Book, type: :model do

  before do
    User.create(email: 'test@test.com', password: 'testtest')
  end

  it "is not valid if title is less than 3 letters" do
    book = Book.new(title: "A", author: "An author")
    expect(book).to have(1).error_on(:title)
  end

  it "is not valid unless title has a unique name" do
    Book.create(title: "A book", author: "An author", user_id: User.first.id)
    book = Book.new(title: "A book", author: "An author", user_id: User.first.id)
    expect(book).to have(1).error_on(:title)
  end

end
