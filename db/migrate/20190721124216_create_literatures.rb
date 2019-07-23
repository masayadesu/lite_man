class CreateLiteratures < ActiveRecord::Migration[5.2]
  def change
    create_table :literatures do |t|
      t.string :author
      t.string :title
      t.string :volume
      t.integer :page
      t.text :url
      t.date :published
      t.string :publish
      t.integer :price
      t.string :keyword
      t.string :state      
      t.string :remarks

      t.timestamps
    end
  end
end
