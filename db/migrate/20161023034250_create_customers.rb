class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :family_name, null:false, length: { maximum: 20 }
      t.string :given_name,  null:false, length: { maximum: 20 }
      t.string :email,       null:false

      t.timestamps null: false
    end
    add_index :customers, :email, unique: true
  end
end
