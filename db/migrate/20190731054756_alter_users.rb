class AlterUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email,:string
    add_column :users, :administrator,:boolean, null: false, default: false

  end
end
