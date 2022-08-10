FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "hello+#{n}@test.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
