require 'rails_helper'

feature 'books' do
  context 'no books to display' do
    scenario 'should display a prompt to add a book' do
      visit '/books'
      expect(page).to have_content('No books have been added')
      expect(page).to have_link('Add your own book to lend!')
    end
  end
end
