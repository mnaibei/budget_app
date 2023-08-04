class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
