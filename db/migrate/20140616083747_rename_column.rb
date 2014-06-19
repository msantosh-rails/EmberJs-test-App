class RenameColumn < ActiveRecord::Migration

  def change
rename_column :samples, :name, :pic_name
  end

end
