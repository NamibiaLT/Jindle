require 'rails_helper'

RSpec.feature 'Users can create their own books' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Book'

    fill_in 'Title', with: 'A Brotherhood'
    fill_in 'Author', with: 'N Torres'
    fill_in 'Description', with: 'Non-fiction'
    fill_in 'Summary', with: 'A look into the homogenous tech industry.'
    click_button 'Create Book'

    expect(page).to have_content 'Book has been created.'
  end
end
