class AddSlugToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :slug, :string
    add_index :scripts, :slug, unique: true
  end
end
