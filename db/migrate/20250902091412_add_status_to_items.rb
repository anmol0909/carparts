class AddStatusToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :status, :string, default: "tracked"
  end
end
