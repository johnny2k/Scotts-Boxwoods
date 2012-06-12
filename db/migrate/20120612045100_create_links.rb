class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link_text
      t.integer :category_id
      t.string :url

      t.timestamps
    end
  end
end
