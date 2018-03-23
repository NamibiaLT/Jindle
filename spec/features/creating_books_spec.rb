require 'rails_helper'

RSpec.feature 'Users can create their own books' do
  before do
    visit root_path

    click_on 'New Book'
  end

  def create_book
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

  scenario 'with correctly implemented title in the title path' do
    create_book

    book = Book.find_by(title: 'Soho')
    expect(page.current_path).to eq book_path(book)
  end

  scenario 'with a title' do
    create_book

    title = 'Jindle'
    expect(page).to have_title title
  end
end

RSpec.feature 'Users can not create a book' do
  scenario 'when an attribute is missing' do
    visit root_path

    click_on 'New Book'
    fill_in 'Title', with: ''
    fill_in 'Author', with: 'Bobby J.'
    fill_in 'Description', with: 'Non-fiction'
    fill_in 'Summary', with: 'A book about housing in NYC.'
    click_on 'Create Book'

    expect(page).to have_content 'Missing field, book could not be created'
  end
end
