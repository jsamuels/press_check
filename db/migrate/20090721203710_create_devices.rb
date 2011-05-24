class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.integer :member_id
      t.string :location
      t.string :name
      t.string :make
      t.string :model
      t.string :serial_number
      t.string :kind
      t.integer :active, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
