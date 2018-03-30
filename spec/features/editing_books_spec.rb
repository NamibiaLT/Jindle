require 'rails_helper'

RSpec.feature 'Users can edit the books they have created' do
  before do
    FactoryBot.create(:book, title: 'Hello')

    visit root_path
    click_on 'Hello'
    click_on 'Edit Book'
  end
  scenario 'when attributes are valid' do
    fill_in 'Title', with: 'Hello, World!'
    click_on 'Update Book'

    expect(page).to have_content 'Your book has been updated'
    expect(page).to have_content 'Hello, World!'
  end

  scenario 'when attributes are invalid' do
    fill_in 'Title', with: ''
    click_button 'Update Book'

    expect(page).to have_content 'Book has not been updated'
  end
end
