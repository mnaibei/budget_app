class UpdateForeignKeyReferencesInGroupRecords < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        remove_foreign_key :group_records, :records, column: :record_id
        add_foreign_key :group_records, :records
      end

      dir.down do
        remove_foreign_key :group_records, :records
        add_foreign_key :group_records, :records, column: :record_id
      end
    end
  end
end
