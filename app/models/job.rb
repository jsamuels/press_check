class Job < ActiveRecord::Base
  belongs_to  :member
  has_many    :sheets

  attr_reader :control_bar, :standard, :version, :tolerance

  def control_bar
   my_bar = ControlBar.find(self.control_bar_id).name
  end
  
  def standard
    Standard.find(self.standard_id).name
  end
  
  def version
    "version?"
  end
  
  def tolerance
    "tolerance?"
  end
  
  class << self
    def available_events(date_filter)
      my_query = "SELECT DISTINCT event
              FROM sheets, jobs, devices, locations
              WHERE locations.id = devices.location_id
              AND devices.id = sheets.device_id
              AND jobs.id = sheets.job_id 
              AND locations.member_id = #{date_filter.member_id} "
      my_query += "AND locations.id = '#{date_filter.location.id}' " if date_filter.location
      my_query += "AND devices.id = '#{date_filter.device.id}' " if date_filter.device
      my_query += "AND jobs.standard_id = '#{date_filter.standard_id}' " if date_filter.standard_id.to_i > 0
      # don't want to filter by color...
      my_query += "AND jobs.customer = '#{date_filter.customer}' " unless date_filter.customer.blank?
      my_values = find_by_sql [my_query]
    end
    
    def available_customers(date_filter)
      my_query = "SELECT DISTINCT customer
              FROM sheets, jobs, devices, locations
              WHERE locations.id = devices.location_id
              AND devices.id = sheets.device_id
              AND jobs.id = sheets.job_id 
              AND locations.member_id = #{date_filter.member_id} "
      my_query += "AND locations.id = '#{date_filter.location.id}' " if date_filter.location
      my_query += "AND devices.id = '#{date_filter.device.id}' " if date_filter.device
      my_query += "AND jobs.standard_id = '#{date_filter.standard_id}' " if date_filter.standard_id.to_i > 0
      # don't want to filter by color...
      my_query += "AND jobs.event = '#{date_filter.event}' " unless date_filter.event.blank?
      my_values = find_by_sql [my_query]
    end
    
    def available_standards(date_filter)
      my_query = "SELECT DISTINCT standard_id
              FROM sheets, jobs, devices, locations
              WHERE locations.id = devices.location_id
              AND devices.id = sheets.device_id
              AND jobs.id = sheets.job_id 
              AND locations.member_id = #{date_filter.member_id} "
      my_query += "AND locations.id = '#{date_filter.location.id}' " if date_filter.location
      my_query += "AND devices.id = '#{date_filter.device.id}' " if date_filter.device
      my_query += "AND jobs.event = '#{date_filter.event}' " unless date_filter.event.blank?
      my_values = find_by_sql [my_query]
    end
  
  end  
end
