class AddNameToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :name, :string
    add_column :scripts, :description, :string
  end
end
