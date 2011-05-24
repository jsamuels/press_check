class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :member_id
      t.integer :standard_id
      t.integer :control_bar_id
      
      t.string :name
      t.string :number
      t.string :customer
      t.string :event
      t.string :printing_process
      t.string :printing_type
      t.string :substrate
      t.string :ink_manufacturer
      t.string :inkset
      t.string :plate
      t.string :plate_curve


      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
