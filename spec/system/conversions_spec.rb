require 'rails_helper'

RSpec.describe 'Conversions', type: :system do
  before do
    driven_by(:rack_test)

    visit '/users/sign_up'

    fill_in 'Full name', with: 'ismail courr'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'test1234'
    fill_in 'Confirm password', with: 'test1234'
    click_on 'Next'
    visit '/'
  end

  describe 'Conversions' do
    it 'should create a conversion (transaction) to the app' do
      click_on 'Add a new category'
      fill_in 'icon url e.g: https://images.com/pic.png', with: 'https://images.com/pic.png'
      fill_in 'Category name', with: 'Amazon'
      click_on 'Create Group'
      click_on 'Amazon'
      click_on 'Add a new transaction'
      fill_in 'Amount', with: '100'
      fill_in 'Name', with: 'Kendel'
      click_on 'Create Transaction'

      expect(page).to have_content 'Transaction was successfully created'
      expect(page).to have_content 'Amazon'
    end

    it 'should add a conversion (transaction) to a Group' do
      click_on 'Add a new category'
      fill_in 'icon url e.g: https://images.com/pic.png', with: 'https://images.com/pic.png'
      fill_in 'Category name', with: 'Amazon'
      click_on 'Create Group'
      click_on 'Amazon'
      click_on 'Add a new transaction'
      fill_in 'Amount', with: '100'
      fill_in 'Name', with: 'Kendel'
      click_on 'Create Transaction'
      click_on 'Add transaction to this group'

      expect(page).to have_content 'Transaction was successfully added to group'
      expect(page).to have_content 'Amazon'
      expect(page).to have_content 'Total Transactions: $100.0'
      expect(page).to have_content 'Kendel'
      expect(page).to have_content 'Transaction N: '
    end
  end
end
