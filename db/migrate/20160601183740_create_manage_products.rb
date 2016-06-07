class CreateManageProducts < ActiveRecord::Migration
  def change
    create_table :manage_products do |t|
      t.string :number
      t.date :manufacture_date
      t.string :state
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
