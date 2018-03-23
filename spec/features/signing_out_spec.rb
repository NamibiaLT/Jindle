require 'rails_helper'

RSpec.feature 'signing out' do
  scenario 'signs out user' do
    user = FactoryBot.create(:user)
    sign_in(user)
    visit root_path
    click_on 'Sign Out'
    expect(page).to have_content('Signed out successfully.')
  end
end
