class Group < ApplicationRecord
  belongs_to :user
  has_many :group_conversions, class_name: 'GroupConversion', foreign_key: :group_id
  has_many :conversions, through: :group_conversions

  validates :name, presence: true
  validates :icon, presence: true
  # sum of all conversions in the group
  def total_conversions
    conversions.sum(:amount)
  end
end
