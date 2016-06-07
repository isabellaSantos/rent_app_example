class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :number
      t.decimal :value
      t.date :due_date
      t.date :paid_at
      t.references :order, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
    end
  end
end
