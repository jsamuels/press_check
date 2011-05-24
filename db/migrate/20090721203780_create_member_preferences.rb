class CreateMemberPreferences < ActiveRecord::Migration
  def self.up
    create_table :member_preferences do |t|
      t.integer :member_id
      t.string :pref
      t.text :value

      t.timestamps
    end
  end

  def self.down
    drop_table :member_preferences
  end
end
