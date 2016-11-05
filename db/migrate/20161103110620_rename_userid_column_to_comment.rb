class RenameUseridColumnToComment < ActiveRecord::Migration
  def change
    rename_column :comments, :user_id_id, :user_id
  end
end
