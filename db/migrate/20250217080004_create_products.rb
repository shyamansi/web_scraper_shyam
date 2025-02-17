class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :price
      t.text :description
      t.string :category
      t.string :url

      t.timestamps
    end
  end
end
