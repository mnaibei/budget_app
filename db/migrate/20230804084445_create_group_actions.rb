class CreateGroupActions < ActiveRecord::Migration[7.0]
  def change
    create_table :group_actions do |t|
      t.references :group, null: false, foreign_key: true
      t.references :action, null: false, foreign_key: { to_table: :actions, column: 'action_id' }

      t.timestamps
    end
  end
end
