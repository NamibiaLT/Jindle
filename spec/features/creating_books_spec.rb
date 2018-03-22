require 'rails_helper'

RSpec.feature 'Users can create their own books' do
  scenario 'with valid attributes' do
    visit root_path

    click_on 'New Book'
    fill_in 'Title', with: 'Soho'
    fill_in 'Author', with: 'Bobby J.'
    fill_in 'Description', with: 'Non-fiction'
    fill_in 'Summary', with: 'A book about housing in NYC.'
    click_on 'Create Book'

    expect(page).to have_content 'Book has been created.'
  end

  scenario 'title is correctly implemented' do
    book = Book.find_by(title: 'Jindle')
    expect(page.current_url).to eq book_url(book)

    title = 'Your Books'
    expect(page).to have_title title
  end
end
