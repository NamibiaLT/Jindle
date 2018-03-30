require 'rails_helper'

RSpec.features 'Users can delete books' do
  scenario 'successfully' do
    FactoryBot.create(:book, title: 'Hello')

    visit root_path
    click_on 'Hello'
    click_on 'Delete Book'

    expect(page).to have_contrnt 'Book has been deleted'
    expect(page.current_path).to eq book_path
    expect(page).to have_no_content 'Hello'
  end
end
