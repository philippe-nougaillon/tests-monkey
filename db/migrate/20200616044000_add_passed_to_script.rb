class AddPassedToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :passed, :boolean
  end
end
