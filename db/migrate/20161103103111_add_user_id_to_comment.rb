class AddUserIdToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :user_id, index: true, foreign_key: true
  end
end
