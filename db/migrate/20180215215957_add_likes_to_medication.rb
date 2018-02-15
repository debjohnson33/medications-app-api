class AddLikesToMedication < ActiveRecord::Migration[5.1]
  def change
  	add_column :medications, :likes, :integer, default: 0
  end
end
