class CreateSheets < ActiveRecord::Migration
  def self.up
    create_table :sheets do |t|
      t.integer :device_id
      t.integer :job_id
      t.string :press_speed
      t.string :operator
      t.string :shift
      t.string :sheet_number
      t.integer :make_ready
      t.string :spectro_device
      t.string :spectro_serialnum
      t.string :control_bar_zone

      t.timestamps
    end
  end

  def self.down
    drop_table :sheets
  end
end
