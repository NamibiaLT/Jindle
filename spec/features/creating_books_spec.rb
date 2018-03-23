require 'rails_helper'

RSpec.feature 'Users can create their own books' do

  def create_book
    visit root_path

    click_on 'New Book'
    fill_in 'Title', with: 'Soho'
    fill_in 'Author', with: 'Bobby J.'
    fill_in 'Description', with: 'Non-fiction'
    fill_in 'Summary', with: 'A book about housing in NYC.'
    click_on 'Create Book'
  end

  scenario 'with valid attributes' do
    create_book

    expect(page).to have_content 'Book has been created.'
  end

  scenario 'with correctly implemented title' do
    create_book

    book = Book.find_by(title: 'Soho')
    expect(page.current_path).to eq book_path(book)

    title = 'Jindle'
    expect(page).to have_title title
  end
end
