require 'rails_helper'

RSpec.describe 'Groups', type: :system do
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

  describe 'Groups' do
    it 'should create a group' do
      click_on 'Add a new category'
      fill_in 'icon url e.g: https://images.com/pic.png', with: 'https://images.com/pic.png'
      fill_in 'Category name', with: 'Amazon'
      click_on 'Create Group'

      expect(page).to have_content 'Group was successfully created'
      expect(page).to have_content 'Amazon'
      expect(page).to have_content '$0.0'
    end

    it 'should not create a group without a name' do
      click_on 'Add a new category'
      fill_in 'icon url e.g: https://images.com/pic.png', with: 'https://images.com/pic.png'
      fill_in 'Category name', with: ''
      click_on 'Create Group'

      expect(page).to have_content "Name can't be blank"
    end

    it 'should go the detail page of a group' do
      click_on 'Add a new category'
      fill_in 'icon url e.g: https://images.com/pic.png', with: 'https://images.com/pic.png'
      fill_in 'Category name', with: 'Amazon'
      click_on 'Create Group'
      click_on 'Amazon'

      expect(page).to have_content 'Amazon'
      expect(page).to have_content 'Total Transactions: $0.0'
      expect(page).to have_content 'Add a new transaction'
    end

    it 'should add a transaction to the app' do
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

    it 'should add a transaction to a Group' do
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
