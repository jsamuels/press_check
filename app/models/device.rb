class Device < ActiveRecord::Base
  belongs_to :location
  has_many :sheets
  has_many :readings, :through => :sheets

  def last_sheet
    self.sheets.last
  end
  
  
  def ave_metric(date_filter, *)
    return Device.device_ave_metric(self.id, date_filter) 
  end

  def filter_sheets(date_filter, *) # return all sheets that match date_filter requirements
    return Device.device_filter_sheets(self.id, date_filter)
  end
  
  def patch_readings(date_filter, *)
    return Device.device_ave_metric_all_patch_colors(self.id, date_filter)
  end
   
  
 class << self   #put class methods here
    # used for the all devices / all locations / this location     
    def device_ave_metric(device_id, date_filter) 
      # DON'T INCLUDE 0.0 values in average
      my_query = "SELECT FORMAT(AVG(t1.value),2) as value FROM (SELECT readings.#{date_filter.metric} as value              
              FROM sheets, readings, jobs
              WHERE sheets.device_id = #{device_id}
              AND readings.sheet_id = sheets.id
              AND jobs.id = sheets.job_id
              AND readings.#{date_filter.metric} + 0.0 <> 0.0
              AND sheets.created_at between '#{date_filter.get_start_date}' and '#{date_filter.get_end_date}' "
      my_query += "AND jobs.standard_id = '#{date_filter.standard_id}' " if date_filter.standard_id.to_i > 0
      my_query += "AND readings.patch = '#{date_filter.patch_color}' " unless date_filter.patch_color.blank?
      my_query += "AND jobs.customer = '#{date_filter.customer}' " unless date_filter.customer.blank?
      my_query += "AND jobs.event = '#{date_filter.event}' " unless date_filter.event.blank?
      my_query += ") as t1"          
      my_values = find_by_sql [my_query] 
      return my_values[0].value
    end
    
    def device_filter_sheets(device_id, date_filter)
      my_query = "SELECT sheets.id 
                  FROM sheets, jobs
                  WHERE sheets.device_id = #{device_id}
                  AND jobs.id = sheets.job_id 
                  AND sheets.created_at between '#{date_filter.get_start_date}' and '#{date_filter.get_end_date}' "
      my_query += "AND jobs.standard_id = '#{date_filter.standard_id}' " if date_filter.standard_id.to_i > 0
      my_query += "AND jobs.customer = '#{date_filter.customer}' " unless date_filter.customer.blank?
      my_query += "AND jobs.event = '#{date_filter.event}' " unless date_filter.event.blank?           
      my_query += "LIMIT 51 "            
      find_by_sql [my_query]            
    end
    
    
    def device_ave_metric_all_patch_colors(device_id, date_filter)
      my_query = "SELECT readings.patch, FORMAT(AVG(readings.#{date_filter.metric}),2) as value
               FROM sheets, readings, jobs
               WHERE sheets.device_id = #{device_id}
               AND readings.sheet_id = sheets.id
               AND jobs.id = sheets.job_id
               AND readings.#{date_filter.metric} + 0 <> 0
               AND sheets.created_at between '#{date_filter.get_start_date}' and '#{date_filter.get_end_date}' "
      my_query += "AND jobs.standard_id = '#{date_filter.standard_id}' " if date_filter.standard_id.to_i > 0
      my_query += "AND jobs.customer = '#{date_filter.customer}' " unless date_filter.customer.blank?
      my_query += "AND jobs.event = '#{date_filter.event}' " unless date_filter.event.blank?
      my_query += "GROUP BY readings.patch "
      my_values = find_by_sql [my_query]
      
      # Convert RecordSet into collection of Readings
      my_readings = []
      my_values.each do |value|
        reading = Reading.new
        reading.patch = value.patch
        reading.metric_value = value.value
        my_readings << reading
      end

      return my_readings.sort_by { |reading| reading.sort_key }
    end
   
   
   
   
   
    def get_device_or_nil(id)
      if id == '' then
        return nil
      else
        find(id)
      end    
    end
    
  end
end
