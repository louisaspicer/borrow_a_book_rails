require 'rails_helper'

feature 'books' do

  before do
    sign_up
  end

  context 'no books to display' do
    scenario 'should display a prompt to add a book' do
      visit '/books'
      expect(page).to have_content('No books have been added')
      expect(page).to have_link('Add a book')
    end
  end

  context 'books have been added' do
    before do
      id = User.first.id
      Book.create(title: "Don't Make Me Think", author: "Steve Krug", user_id: id)
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
      click_link('Add a book')
      fill_in('Title', with: 'The Design of Everyday Things')
      fill_in('Author', with: 'Don Norman')
      click_button('Submit your book')
      expect(page).to have_content('The Design of Everyday Things')
      expect(current_path).to eq('/books')
    end
  end

  context 'viewing books' do

    before do
      id = User.first.id
      Book.create(title: "The Design of Everyday Things", author: "Don Norman", user_id: id)
      Book.create(title: "Don't Make Me Think", author: "Steve Krug", user_id: id)
    end

    scenario 'click on book to view book on its own page' do
      book_id = Book.first.id
      visit('/books')
      click_link('The Design of Everyday Things')
      expect(page).to have_content('The Design of Everyday Things')
      expect(page).not_to have_content("Don't Make Me Think")
      expect(current_path).to eq "/books/#{book_id}"
    end
  end

  context 'editing books' do

    before { Book.create(title: 'The Design of Everyday Thing', author: 'Don Norma', user_id: User.first.id) }

    scenario 'let a user edit a book' do
      visit '/books'
      click_button 'Edit'
      fill_in 'Title', with: 'The Design of Everyday Things'
      fill_in 'Author', with: 'Don Norman'
      click_button 'Update your book'
      click_link 'The Design of Everyday Things'
      expect(page).to have_content 'The Design of Everyday Things'
      expect(page).to have_content 'Don Norman'
    end
  end

  context 'deleting books' do

    before { Book.create(title: 'The Design of Everyday Things', author: 'Don Norman', user_id: User.first.id) }

    scenario 'removes a book when a user clicks a delete link' do
      visit '/books'
      click_button 'Delete'
      expect(page).not_to have_content 'Don Norman'
      expect(page).to have_content 'The Design of Everyday Things deleted successfully'
    end
  end

  context 'viewing own books' do

    before { Book.create(title: 'The Design of Everyday Things', author: 'Don Norman', user_id: User.first.id) }

    scenario 'view only books user owns' do
      click_link('Sign out')
      sign_up_2
      add_book
      visit '/books'
      click_link 'My books'
      expect(page).to have_content('A Book')
      expect(page).not_to have_content('The Design of Everyday Things')
    end

  end
end
