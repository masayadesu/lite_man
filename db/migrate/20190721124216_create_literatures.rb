class CreateLiteratures < ActiveRecord::Migration[5.2]
  def change
    create_table :literatures do |t|
      t.string :author
      t.string :title
      t.string :volume
      # t.integer :page
      t.string :page
      t.text :url
      # t.text :published
      t.string :published
      t.string :publish
      t.integer :price
      t.string :keyword
      t.string :state
      # t.string :remarks
      t.text :remarks

      t.timestamps
    end
  end
end
