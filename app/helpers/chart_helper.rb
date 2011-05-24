module ChartHelper
  def chart_width
    590
  end
  def chart_height
    550
  end
  def chart_swf(chart_type)
    chart_type
  end
  
  def xml_data(date_filter)
      case date_filter.chart_group
      when "device_by_patch"
        device_patch_chart_xml(date_filter)
      when "device_by_location"
        device_location_chart_xml(date_filter)
      when "device_all_locations"
        all_locations_chart_xml(date_filter)
      when "device_trend"
        create_chart_xml_device_trend_de(date_filter, date_filter.metric) #still being worked 
      when "patch_by_sheet"
        sheet_patches_chart_xml(date_filter)
      else
        fail params[:action].inspect
      end
  
  end
  

  
end