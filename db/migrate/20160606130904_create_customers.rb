class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :cpf
      t.string :phone
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
