class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :Name
      t.text :Description
      t.string :category
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
