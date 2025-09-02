class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :email
      t.integer :phone_number
      t.timestamps
    end
  end
end
