require 'rails_helper'

feature 'Requests' do
  before do
    sign_up
    Book.create title: 'The Design of Everyday Things', author: 'Don Norman', user_id: User.first.id
  end

  scenario 'allows users to request on a book' do
    # save_and_open_page
    click_link('Sign out')
    sign_up_2
    book_title = Book.first.title
    visit '/books'
    click_button 'Request'
    fill_in "Request from", with: DateTime.now.strftime('%d/%m/%Y')
    fill_in "Request from", with: (DateTime.now + 1).strftime('%d/%m/%Y')
    click_button "Request #{book_title}"
    expect(page).to have_content("You have made a request for #{book_title}")
  end

  scenario 'user can see a list of incoming requests' do
    click_link('Sign out')
    sign_up_2
    request_a_book
    book_title = Book.first.title
    click_link('Incoming Requests')
    expect(page).to have_content("#{book_title} has been requested by test2@example.com")
  end

end
