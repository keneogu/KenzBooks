class AddCustomerInfoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subcription_status, :string
    add_column :users, :subscription_end_date, :datetime
    add_column :users, :subscription_start_date, :datetime
  end
end
