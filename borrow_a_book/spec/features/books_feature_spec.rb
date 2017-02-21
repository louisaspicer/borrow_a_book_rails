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

  context 'adding books' do
    scenario 'prompts user to fill out a form, then displays the book' do
      visit('/books')
      click_link('Add your own book to lend!')
      fill_in('Title', with: 'The Design of Everyday Things')
      fill_in('Author', with: 'Don Norman')
      click_button('Submit your book')
      expect(page).to have_content('The Design of Everyday Things')
      expect(current_path).to eq('/books')
    end
  end

  context 'viewing books' do
    let!(:book1){ Book.create(title: "The Design of Everyday Things", author: "Don Norman") }
    let!(:book2){ Book.create(title: "Don't Make Me Think", author: "Steve Krug") }
    scenario 'click on book to view book on its own page' do
      visit('/books')
      click_link('The Design of Everyday Things')
      expect(page).to have_content('The Design of Everyday Things')
      expect(page).not_to have_content("Don't Make Me Think")
      expect(current_path).to eq "/books/#{book1.id}"
    end
  end
end
