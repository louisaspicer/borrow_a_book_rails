require 'rails_helper'

feature 'books' do
  context 'no books to display' do
    scenario 'should display a prompt to add a book' do
      visit '/books'
      expect(page).to have_content('No books have been added')
      expect(page).to have_link('Add your own book to lend!')
    end
  end

  context 'books have been added' do
    before do
      Book.create(title: "Don't Make Me Think", author: "Steve Krug")
    end

    scenario 'displaying the books' do
      visit('/books')
      expect(page).to have_content("Don't Make Me Think")
      expect(page).not_to have_content("No books have been added")
    end
  end
end
