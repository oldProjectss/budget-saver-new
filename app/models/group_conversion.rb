class GroupConversion < ApplicationRecord
  belongs_to :group, class_name: 'Group', foreign_key: :group_id
  belongs_to :conversion, class_name: 'Conversion', foreign_key: :conversion_id
end
