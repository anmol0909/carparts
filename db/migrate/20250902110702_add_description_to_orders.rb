class AddDescriptionToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :description, :text
  end
end
