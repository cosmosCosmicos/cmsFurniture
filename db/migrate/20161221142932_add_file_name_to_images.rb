class AddFileNameToImages < ActiveRecord::Migration
  def change
    add_column :images, :file_name, :string
    add_column :images, :path_file, :string
  end
end
