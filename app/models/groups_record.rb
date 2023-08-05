class GroupsRecord < ApplicationRecord
  self.table_name = 'groups_records'
  belongs_to :group
  belongs_to :record
end