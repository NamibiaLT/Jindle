require 'rails_helper'

RSpec.feature 'Users are able to view books' do
  scenario 'with details about the book' do
    book = FactoryBot.create(:book, title: 'Something')

    visit root_path
    click_on 'New Book'

    expect(page.current_path).to eq book_path(book)
  end
end
