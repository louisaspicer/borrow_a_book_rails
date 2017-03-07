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
    expect(current_path).to eq '/books'
    expect(page).to have_content("You have made a request for #{book_title}")
  end

end
