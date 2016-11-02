class AddCompanyIdToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :company, index: true, foreign_key: true
  end
end
