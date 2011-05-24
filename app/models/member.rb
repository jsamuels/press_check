class Member < ActiveRecord::Base
  has_many :locations
  has_many :jobs
  has_many :users
  has_many :member_preferences
  has_many :devices, :through => :locations
  accepts_nested_attributes_for :member_preferences, :allow_destroy => true
end
