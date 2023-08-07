class RenameGroupActionsToGroupRecords < ActiveRecord::Migration[7.0]
  def change
    rename_table :group_actions, :group_records
  end
end
