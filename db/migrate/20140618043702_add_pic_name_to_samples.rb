class AddPicNameToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :picname, :string
  end
end
