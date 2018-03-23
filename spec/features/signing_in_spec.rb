require 'rails_helper'

RSpec.feature 'signing in' do
  let(:user){ FactoryBot.create(:user) }
  scenario 'signs in user' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'user leaves email blank' do
    visit new_user_session_path
    fill_in :user_email, with: ''
    fill_in :user_password, with: user.password
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or Password.')
  end

  scenario 'user leaves password blank' do
    visit new_user_session_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: ''
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or Password.')
  end

  scenario 'user leaves email and password blank' do
    visit new_user_session_path
    fill_in :user_email, with: ''
    fill_in :user_password, with: ''
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or Password.')
  end

  scenario 'unregistered user attemps sign-in' do
    visit new_user_session_path
    fill_in :user_email, with: ''
    fill_in :user_password, with: ''
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or Password.')
  end
end
