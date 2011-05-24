class CreateStandards < ActiveRecord::Migration
  def self.up
    create_table :standards do |t|
      t.string :name
      t.string :version
      t.binary :icc

      t.timestamps
    end
  end

  def self.down
    drop_table :standards
  end
end
