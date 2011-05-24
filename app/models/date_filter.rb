class DateFilter
  attr_internal :start_date
  attr_internal :end_date
  attr_internal :location
  attr_internal :device
  attr_internal :sheet
  attr_internal :tolerance_id
  attr_internal :standard_id
  attr_internal :patch_color
  attr_internal :member_id
  attr_internal :customer
  attr_internal :event
  attr_internal :cur_action
  attr_internal :cur_controller
  attr_internal :chart_group
  attr_internal :chart_type
  attr_internal :metric
  
  attr_internal :substrate
  
  def clear!
    self.customer =""
    self.event =""
    self.device = nil
    self.sheet = nil
    self.chart_group = "device_by_locaiton"
    self.chart_type = 'Column3D.swf'
    # set filter to first (default) standard per metric
    self.standard_id = self.find_standards[0].id if self.find_standards[0]
    # set filter to first (default) patch color per metric
    self.patch_color = self.find_patch_colors[0].patch if self.find_patch_colors[0]
    # self.start_date = ""
    # self.end_date = ""
    self.cur_action = 'chart'
    self.cur_controller = 'devices'
  end
  
  def find_locations
    all_location = Location.new
    all_location.id, all_location.name  = "", "All"
    locations = Location.find(:all, :conditions => ["member_id = ? ", member_id ] )
    my_locations = [all_location]
    locations.each do |location|
      if location.devices.size > 0 
        my_locations << location
      end  
    end 
    return my_locations
  end
  
  def find_location_devices
    if location.blank?
      devices = Member.find(member_id).devices
    else
      devices = location.devices    
    end
    my_devices = []
    if chart_group =~ /device_[a-z]+_location[s]*/ 
      all_device = Device.new
      all_device.id = ""
      all_device.name = "All"
      my_devices << all_device
    end 
    
    devices.each do |device|
      my_devices << device
    end
    return my_devices
  end
  
  def find_search_devices
    if device.blank?
      if location.blank?
        devices = Member.find(member_id).devices
      else
        devices = location.devices    
      end
    else
      devices = [device]  
    end  
  end
  
  def find_patch_colors
    patches = Reading.find(:all, :select => "DISTINCT(patch)" ) 
    my_patches = []
    # add all patches if the metric is dE
    if metric == 'de'
      all_patch = Reading.new
      all_patch.patch = ""
      my_patches << all_patch
    end
    # if patch is used for this metric, add it
    patches.each do |patch| 
      if patch.patch?(metric)
        my_patches << patch
      end  
    end
    
    return my_patches.sort_by { |reading| reading.sort_key }
  end
  
  def find_tolerances
    Tolerance.find(:all, :conditions => ["member_id = ? ", member_id ] )
  end
  
  def find_standards
    my_standards = []
    if "de" == self.metric
      standard = Standard.new
      standard.id = ""
      standard.name = "All"
      my_standards << standard
    end  
    Job.available_standards(self).each do |job|
      my_standards << Standard.find(job[:standard_id])
    end
    return my_standards 
  end
  
  def find_customers
    # Job.find(:all, :select => "DISTINCT customer ", :conditions => ["member_id = ? ", member_id ]) 
    Job.available_customers(self) 
  end
  
  def find_events
    Job.available_events(self)
  end
  
  def device_id
    if device && device.class == Device
      device.id
    else
      0  
    end
  end
  
  def get_start_date
    get_start_date = start_date.blank? ? (Time.now - 30.days).to_date : start_date.to_date
  end
  
  def get_end_date
    get_end_date = end_date.blank? ? Time.now().to_date : end_date.to_date 
  end  

  def metrics
    ['dE', 'Density', 'Dot_Gain', 'Print_Contrast', 'G7']
  end

end  