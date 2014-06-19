class AddColumns < ActiveRecord::Migration
  def change
	add_column :samples, :left, :float, {:length => 15, :decimals => 12}
	add_column :samples, :top, :float, {:length => 15, :decimals => 12}	
  end

end
