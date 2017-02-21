class AddBookRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :book, foreign_key: true
  end
end
