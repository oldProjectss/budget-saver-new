require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)

    visit '/users/sign_up'

    fill_in 'Full name', with: 'ismail courr'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'test1234'
    fill_in 'Confirm password', with: 'test1234'
    click_on 'Next'
    click_on 'Sign out'
  end

  describe 'Users' do
    it 'should create a user' do
      visit '/users/sign_up'

      fill_in 'Full name', with: 'ismail name'
      fill_in 'Email', with: 'test@mail.com'
      fill_in 'Password', with: 'test1234'
      fill_in 'Confirm password', with: 'test1234'
      click_on 'Next'

      expect(page).to have_content 'Welcome! You have signed up successfully'
    end

    it 'should not create a user with duplicate email' do
      visit '/users/sign_up'

      fill_in 'Full name', with: 'ismail'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'test1234'
      fill_in 'Confirm password', with: 'test1234'
      click_on 'Next'

      expect(page).to have_content 'Email has already been taken'
    end

    it 'should return password is short if it is less then 6 character long' do
      visit '/users/sign_up'

      fill_in 'Full name', with: 'ismail courr'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'test'
      fill_in 'Confirm password', with: 'test'
      click_on 'Next'

      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
    end

    it 'should login a user' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'test1234'
      click_on 'Log in'

      expect(page).to have_content 'Signed in successfully'
    end

    it 'should not login a user with wrong password' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'test123'
      click_on 'Log in'

      expect(page).to have_content 'Invalid Email or password'
    end
  end
end
