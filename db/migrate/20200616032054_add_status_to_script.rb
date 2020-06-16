class AddStatusToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :status, :boolean
  end
end
