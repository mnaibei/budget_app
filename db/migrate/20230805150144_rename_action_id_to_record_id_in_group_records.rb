class RenameActionIdToRecordIdInGroupRecords < ActiveRecord::Migration[7.0]
  def change
    rename_column :group_records, :action_id, :record_id
  end
end
