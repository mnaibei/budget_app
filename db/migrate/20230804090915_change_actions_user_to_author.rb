class ChangeActionsUserToAuthor < ActiveRecord::Migration[7.0]
  def change
    rename_column :actions, :user_id, :author_id
  end
end
