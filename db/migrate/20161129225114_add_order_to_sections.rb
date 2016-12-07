class AddOrderToSections < ActiveRecord::Migration
  def change
    add_column :sections, :order, :integer
    add_column :sections, :menu_display, :boolean
  end
end
