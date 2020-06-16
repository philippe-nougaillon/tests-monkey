class AddPassedAtToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :passed_at, :datetime
  end
end
