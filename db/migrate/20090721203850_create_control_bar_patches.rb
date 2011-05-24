class CreateControlBarPatches < ActiveRecord::Migration
  def self.up
    create_table :control_bar_patches do |t|
      t.integer :control_bar_id
      t.string  :patch 
      t.string :row_num
      t.string :column_num
      
      t.timestamps
    end
  end

  def self.down
    drop_table :control_bar_patches
  end
end
