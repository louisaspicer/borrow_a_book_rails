require 'rails_helper'

feature 'Comments' do
  before { Book.create title: 'The Design of Everyday Things', author: 'Don Norman' }

  scenario 'allows users to comment on a book' do
     visit '/books'
     click_link 'Comment on The Design of Everyday Things'
     fill_in 'Comments', with: 'Great book!'
     click_button 'Leave Comment'
     expect(current_path).to eq '/books'
     expect(page).to have_content('Great book!')
  end

end
