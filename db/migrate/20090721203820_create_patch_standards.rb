class CreatePatchStandards < ActiveRecord::Migration
  def self.up
    create_table :patch_standards do |t|
      t.integer :standard_id

      t.string :patch

      t.float :spectral_1
      t.float :spectral_2
      t.float :spectral_3
      t.float :spectral_4
      t.float :spectral_5
      t.float :spectral_6
      t.float :spectral_7
      t.float :spectral_8
      t.float :spectral_9
      t.float :spectral_10
      t.float :spectral_11
      t.float :spectral_12
      t.float :spectral_13
      t.float :spectral_14
      t.float :spectral_15
      t.float :spectral_16
      t.float :spectral_17
      t.float :spectral_18
      t.float :spectral_19
      t.float :spectral_20
      t.float :spectral_21
      t.float :spectral_22
      t.float :spectral_23
      t.float :spectral_24
      t.float :spectral_25
      t.float :spectral_26
      t.float :spectral_27
      t.float :spectral_28
      t.float :spectral_29
      t.float :spectral_30
      t.float :spectral_31
      t.float :spectral_32
      t.float :spectral_33
      t.float :spectral_34
      t.float :spectral_35
      t.float :spectral_36
      
      t.float :density
      t.float :dot_gain
      t.float :print_contrast
      
      t.float :l
      t.float :a
      t.float :b
      t.float :c
      t.float :h
      
      t.float :r
      t.float :g
      t.float :b
      
      t.float :g7_hg
      t.float :g7_hr
      t.float :g7_sc


      t.timestamps
    end
  end

  def self.down
    drop_table :patch_standards
  end
end
