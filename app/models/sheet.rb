class Sheet < ActiveRecord::Base
  belongs_to :device
  belongs_to :job
  has_many :readings
  
  #business rules
  def sheet_pass?
    if ave_de_ok? && max_de_ok?
      true
    else
      false
    end 
  end
  
  def ave_de_ok?
    if ave_de.to_f < 5.0 
      true
    else
      false
    end  
  end
  
  def max_de_ok?
    if max_de.to_f < 8.0
      true
    else
      false
    end  
  end
  
  
  #instance methods
  def ave_de
    self.ave_metric('de')
  end
  
  def max_de
    self.max_metric('de')
  end
  
  def ave_metric(metric)
	  return readings.find(:last, :select => "FORMAT(AVG(#{metric}),2) as value", :conditions => ["sheet_id = ? AND #{metric} + 0.0 <> 0.0 ", self.id ]).value
	end
  
  def max_metric(metric)
	 return readings.find(:last, :select => "FORMAT(MAX(#{metric}),2) as value", :conditions => ["sheet_id = ? ", self.id ]).value
  end
  
  def patch_metric(date_filter, metric)
    my_value = readings.find(:last, :select => "FORMAT(#{metric},2) as value", :conditions => ["sheet_id = ? AND patch = ? ", self.id, date_filter.patch_color ])
    return my_value.value if my_value
  end
  
  def gray_50
     #gray_50 = patches.find(:first, :conditions => ["patch_num = ? ", 51 ], :select => "FORMAT(dE2000,2) as value").value
      'na'
  end
  
  
  class << self
  #put class methods here

    
  end # class methods
end # Class
