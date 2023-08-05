class Group < ApplicationRecord
  self.table_name = 'groups'
  belongs_to :user
  has_many :groups_records
  has_and_belongs_to_many :records, join_table: 'groups_records'

  def total_amount
    records.sum(:amount)
  end
end
