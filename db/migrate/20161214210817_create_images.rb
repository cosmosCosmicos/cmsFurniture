class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :description
      t.boolean :display
      t.boolean :show_name
      t.boolean :is_published
      t.integer :order

      t.timestamps null: false
    end
  end
end
