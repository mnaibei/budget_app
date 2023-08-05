class RenameGroupRecordsToGroupsRecords < ActiveRecord::Migration[7.0]
  def change
    rename_table :group_records, :groups_records
  end
end
