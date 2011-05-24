class CreateControlBars < ActiveRecord::Migration
  def self.up
    create_table :control_bars do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :control_bars
  end
end
