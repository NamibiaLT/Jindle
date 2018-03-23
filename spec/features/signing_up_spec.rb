require 'rails_helper'

RSpec.feature 'signing up' do
  before do
    visit new_user_registration_path
  end

  scenario 'user signs up' do
    fill_in :user_email, with: 'bob@example.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('Welcome, bob@example.com')
  end

  scenario 'user leaves email blank' do
    fill_in :user_email, with: ''
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_on 'Sign up'
    save_page
    expect(page).to have_content('Email can not be blank')
  end

  scenario 'user leaves password blank' do
    fill_in :user_email, with: 'bob@example.com'
    fill_in :user_password, with: ''
    fill_in :user_password_confirmation, with: ''
    click_on 'Sign up'
    save_page
    expect(page).to have_content('Password can not be blank')
  end

  scenario 'user passwords do not match' do
    fill_in :user_email, with: 'bob@example.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'puppies'
    click_on 'Sign up'
    save_page
    expect(page).to have_content('Password confirmation does not match password')
  end

  scenario 'user passwords are too short' do
    fill_in :user_email, with: 'bob@example.com'
    fill_in :user_password, with: 'pswd'
    fill_in :user_password_confirmation, with: 'pswd'
    click_on 'Sign up'
    save_page
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end
end
