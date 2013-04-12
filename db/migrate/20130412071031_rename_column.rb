class RenameColumn < ActiveRecord::Migration
  def up
  	    rename_column :entries, :titile, :title
  end

  def down
  end
end
