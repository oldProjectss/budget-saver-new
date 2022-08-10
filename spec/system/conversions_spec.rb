require 'rails_helper'

RSpec.describe 'Conversions', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Conversions' do
    it 'should create a conversion' do
      visit conversions_url
      click_on 'New conversion'

      fill_in 'User', with: 1
      fill_in 'Amount', with: 1
      fill_in 'Authorid', with: 1
      fill_in 'Name', with: 'test'
      click_on 'Create Conversion'

      expect(page).to have_content 'Conversion was successfully created'
      click_on 'Back'
    end

    it 'should update a conversion' do
      visit conversion_url(1)
      click_on 'Edit this conversion', match: :first

      fill_in 'User', with: 1
      fill_in 'Amount', with: 1
      fill_in 'Authorid', with: 1
      fill_in 'Name', with: 'test'
      click_on 'Update Conversion'

      expect(page).to have_content 'Conversion was successfully updated'
      click_on 'Back'
    end

    it 'should destroy a conversion' do
      visit conversion_url(1)
      click_on 'Destroy this conversion', match: :first

      expect(page).to have_content 'Conversion was successfully destroyed'
    end

    it 'should not create a conversion without a name' do
      visit conversions_url
      click_on 'New conversion'

      fill_in 'User', with: 1
      fill_in 'Amount', with: 1
      fill_in 'Authorid', with: 1
      click_on 'Create Conversion'

      expect(page).to have_content "Name can't be blank"
      click_on 'Back'
    end

    it 'should not create a conversion without a user' do
      visit conversions_url
      click_on 'New conversion'

      fill_in 'Amount', with: 1
      fill_in 'Authorid', with: 1
      fill_in 'Name', with: 'test'
      click_on 'Create Conversion'

      expect(page).to have_content "User can't be blank"
      click_on 'Back'
    end

    it 'should not create a conversion without an amount' do
      visit conversions_url
      click_on 'New conversion'

      fill_in 'User', with: 1
      fill_in 'Authorid', with: 1
      fill_in 'Name', with: 'test'
      click_on 'Create Conversion'

      expect(page).to have_content "Amount can't be blank"
      click_on 'Back'
    end

    it 'should not create a conversion without an author' do
      visit conversions_url
      click_on 'New conversion'

      fill_in 'User', with: 1
      fill_in 'Amount', with: 1
      fill_in 'Name', with: 'test'
      click_on 'Create Conversion'

      expect(page).to have_content "Authorid can't be blank"
      click_on 'Back'
    end
  end
end
