class RenameActionsToRecords < ActiveRecord::Migration[7.0]
  def change
    rename_table :actions, :records
  end
end
