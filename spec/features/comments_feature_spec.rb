require 'rails_helper'

feature 'Comments' do
  before do
    sign_up
    Book.create title: 'The Design of Everyday Things', author: 'Don Norman', user_id: User.first.id
  end

  scenario 'allows users to comment on a book' do
     visit '/books'
     click_link 'Comment'
     fill_in 'Comments', with: 'Great book!'
     click_button 'Leave Comment'
     expect(current_path).to eq '/books'
     expect(page).to have_content('Great book!')
  end

end
