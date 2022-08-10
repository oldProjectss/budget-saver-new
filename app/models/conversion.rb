class Conversion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_conversions, class_name: 'GroupConversion', foreign_key: :conversion_id

  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
