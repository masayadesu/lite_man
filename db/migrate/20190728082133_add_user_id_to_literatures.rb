class AddUserIdToLiteratures < ActiveRecord::Migration[5.2]
  def change
    add_column :literatures, :user_id, :integer
  end
end
