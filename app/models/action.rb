class Action < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :group_actions
  has_many :groups, through: :group_actions
end
