class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :quantity, default: 0
      t.timestamps
    end
  end
end
