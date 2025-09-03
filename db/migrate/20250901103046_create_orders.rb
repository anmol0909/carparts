class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :item, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.date :return_by
      t.string :borrowed_by
      t.string :status, default: "borrowed"  # borrowed, returned, expired
      t.timestamps
    end
  end
end
