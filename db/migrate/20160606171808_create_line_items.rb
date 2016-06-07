class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :manage_product, index: true, foreign_key: true
      t.decimal :total
    end
  end
end
