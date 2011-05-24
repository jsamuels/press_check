class Location < ActiveRecord::Base
  belongs_to  :member
  has_many :devices
  
  def short_name
    self.name.gsub(/RNS /, '')
  end
end
