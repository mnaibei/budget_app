class Group < ApplicationRecord
  belongs_to :user
  has_many :group_actions
  has_many :actions, through: :group_actions

  def total_amount
    actions.sum(:amount)
  end
end
