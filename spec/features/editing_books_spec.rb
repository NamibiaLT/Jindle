require 'rails_helper'

RSpec.feature 'Users can edit the books they have created' do

  scenario 'when attributes are valid' do
    FactoryBot.create(:book, title: 'Hello')

    visit root_path
    click_on 'Hello'
    click_on 'Edit Book'
    fill_in 'Title', with: 'Hello, World!'
    click_on 'Update Book'

    expect(page).to have_content 'Your book has been updated'
    expect(page).to have_content 'Hello, World!'
  end
end
