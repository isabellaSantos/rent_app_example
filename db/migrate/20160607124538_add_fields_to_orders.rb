class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :initial_date, :date
    add_column :orders, :final_date, :date
  end
end
