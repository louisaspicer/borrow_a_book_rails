def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def login
  visit('/')
  click_link('Login')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  click_button('Log in')
end

def sign_up_2
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test2@example.com')
  fill_in('Password', with: 'testtest2')
  fill_in('Password confirmation', with: 'testtest2')
  click_button('Sign up')
end

def add_book
  click_link('Add a book')
  fill_in('Title', with: 'A Book')
  fill_in('Author', with: 'An author')
  click_button('Submit your book')
end

def request_a_book
  book_title = Book.first.title
  visit '/books'
  click_button 'Request'
  fill_in "Request from", with: DateTime.now.strftime('%d/%m/%Y')
  fill_in "Request from", with: (DateTime.now + 1).strftime('%d/%m/%Y')
  click_button "Request #{book_title}"
end
