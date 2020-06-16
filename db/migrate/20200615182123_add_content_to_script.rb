class AddContentToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :content, :string
  end
end
