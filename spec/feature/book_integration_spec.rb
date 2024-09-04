# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book with new attributes', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: 'Sample Title'
    fill_in 'book[author]', with: 'Sample Author'
    fill_in 'book[price]', with: 15.99
    fill_in 'book[published_date]', with: '2024-01-01'
    click_on 'Create Book'

    visit books_path
    expect(page).to have_content('Sample Title')
    expect(page).to have_content('Sample Author')
    expect(page).to have_content(15.99)
    expect(page).to have_content('2024-01-01')
  end

  scenario 'invalid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: ''
    fill_in 'book[author]', with: ''
    fill_in 'book[price]', with: ''
    fill_in 'book[published_date]', with: ''
    click_on 'Create Book'

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Author can't be blank")
    expect(page).to have_content("Price can't be blank")
    expect(page).to have_content("Published date can't be blank")
  end
end