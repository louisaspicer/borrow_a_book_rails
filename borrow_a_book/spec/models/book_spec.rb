require 'rails_helper'

describe Book, type: :model do

  it "is not valid unless it has a unique name" do
    Book.create(title: "A book", author: "An author")
    book = Book.new(title: "A book", author: "An author")
    expect(book).to have(1).error_on(:title)
  end

end
