def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def add_book
  click_link('Add a book')
  fill_in('Title', with: 'A Book')
  fill_in('Author', with: 'An author')
  click_button('Submit your book')
end
