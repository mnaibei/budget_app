class Record < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups
  has_many :group_records, dependent: :destroy
end
