class PatchTolerance < ActiveRecord::Base
  attr_internal :de

  class << self
  #put class methods here
    def find_tolerance(date_filter)
      if 'de' == date_filter.metric
        5.0
      else
        my_query = "SELECT *
                 FROM patch_tolerances
                 WHERE tolerance_id = #{date_filter.tolerance_id}
                 AND patch = '#{date_filter.patch_color}'"
        my_values = find_by_sql [my_query]
        my_values[0]["#{date_filter.metric}"]
      end  
    end
    
  end # class methods



end