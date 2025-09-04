class ChangePhoneNumberTypeInMembers < ActiveRecord::Migration[8.0]
  def change
    change_column :members, :phone_number, :string
  end
end
