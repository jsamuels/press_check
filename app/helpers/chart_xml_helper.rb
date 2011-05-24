module ChartXmlHelper
  def device_patch_chart_xml(date_filter)
    if date_filter.device
      data = "&dataXML=<chart caption='#{date_filter.device.name} Average #{date_filter.metric}' numberPrefix=''>"
      device = date_filter.device
      device.patch_readings(date_filter).each do |reading|
        data += "<set label='#{reading.name}' color='#{reading.hex_color}' value='#{reading.metric_value}' toolText='#{reading.patch}' />" unless reading.metric_value == 0
      end
      data += "#{get_trend_zones(date_filter)}</chart>"
      data
    end  
  end
  
  def sheet_patches_chart_xml(date_filter)
    if date_filter.sheet
      data = "&dataXML=<chart caption='Sheet #{date_filter.sheet.id}' numberPrefix=''>"
      date_filter.sheet.readings.sort_by { |reading| reading.sort_key }.each do |reading|
        data += "<set label='#{reading.name}' color='#{reading.hex_color}' value='#{reading.metric(date_filter.metric)}' toolText='#{reading.patch}' />" unless reading.metric(date_filter.metric) == 0
      end
      data += "#{get_trend_zones(date_filter)}</chart>"
    end  
  end
  
  def create_chart_xml_device_trend_de(date_filter, metric)
    if date_filter.device
      device = date_filter.device
      # This is LIMITED TO 51 in the MySQL Query
      # NOT sure if this conflicts with the idea of dates, but don't want to get 1,000 entries either
      filter_sheets = []
      device.filter_sheets(date_filter).each do |sheet|
        filter_sheets << Sheet.find(sheet.id)
      end
      
      category_xml = "<categories >"
      if "de" == date_filter.metric
        ave_xml = "<dataSet seriesName='Ave #{metric}' color='009900' anchorBorderColor='009900'>"
        max_xml = "<dataSet seriesName='Max #{metric}' color='990000' anchorBorderColor='990000'>"     
      end
      unless date_filter.patch_color.blank? 
        my_reading = Reading.new
        my_reading.patch = date_filter.patch_color
        patch_xml = "<dataSet seriesName='#{my_reading.name + ' ' + metric}' color='000099' anchorBorderColor='000099'>"
      end
      

      
      i = 1 
      filter_sheets.each do |sheet|
        link = url_for(:controller => "devices", :action => "patch_by_sheet", :sheet_id => sheet.id)
        category_xml += "<category label='#{i}'/>"
        ave_xml += "<set value='#{sheet.ave_metric(metric)}' link='#{link}' toolText='#{sheet.ave_metric(metric)}: #{sheet.id}' />" if ave_xml
        max_xml += "<set value='#{sheet.max_metric(metric)}' link='#{link}' toolText='#{sheet.max_metric(metric)}: #{sheet.id}' />" if max_xml
        patch_xml += "<set value='#{sheet.patch_metric(date_filter, metric)}' link='#{link}' toolText='#{sheet.patch_metric(date_filter, metric)}: #{sheet.id}' />" if patch_xml
        i += 1         
      end
      
 
      category_xml += "</categories>"
      ave_xml += "</dataSet>" if ave_xml
      max_xml += "</dataSet>" if max_xml
      patch_xml += "</dataSet>" if patch_xml
      
      data = "&dataXML=<chart lineThickness='1' showValues='0' formatNumberScale='0' anchorRadius='2'
                  divLineAlpha='20' divLineColor='CC3300' divLineIsDashed='1' labelStep='2' 
                  numvdivlines='9' connectNullData='1'
                  caption='#{device.name} ' subcaption='Trend Data' xAxisName='#{filter_sheets[0].created_at.to_date} to #{filter_sheets[-1].created_at.to_date}'
                  yAxisName='#{metric}'> #{category_xml} #{ave_xml} #{max_xml} #{patch_xml}
                  #{get_trend_zones(date_filter)}
                  </chart>"
      data
    end  
  end
  
  def device_location_chart_xml(date_filter)
    data = "&dataXML=<chart  xAxisName='Device' yAxisName='Average #{date_filter.metric}' numberPrefix='' rotateValues='1' placeValuesInside='1' >"
    date_filter.find_search_devices.each do |device|
      link = url_for(:controller => "devices", :action => "device_trend", :device_id => device.id)
      data += "<set label='#{device.name}' color='3300FF' value='#{device.ave_metric(date_filter)}' link='#{link}' toolText='#{device.name}' />"
    end
    data += "#{get_trend_zones(date_filter)}</chart>"
    data
  end
  
  def all_locations_chart_xml(date_filter)
    if date_filter.device.blank?
      data = all_locations_chart_xml_multiple_devices(date_filter)
    else
      data = all_locations_chart_xml_one_device(date_filter)
    end
    data
  end
  
  def all_locations_chart_xml_multiple_devices(date_filter)
    data = "&dataXML=<chart  numberPrefix=''  labelDisplay='Rotate' slantLabels='1' showValues='0' >"
    
    categories = "<categories>"
    max_devices = 0
    member.locations.each do |location|
      categories += "<category name='#{location.short_name}'/>"
      if location.devices.count > max_devices
        max_devices = location.devices.count
      end  
    end
    categories += "</categories>"
    
    # *******  make this crappy xml format where elements are NOT grouped by location, but by device # - what a pain in the butt! ************
    datasets = []
    max_devices.times do |x|
      datasets[x] = []
    end
    
    
    member.locations.each do |location|
      i = 0
      location.devices.each do |device|
        link = url_for(:controller => "devices", :action => "device_trend", :device_id => device.id)
        datasets[i] << "<set value='#{device.ave_metric(date_filter)}' link='#{link}' toolText='#{device.name}' />"
        i += 1  
      end
      # finish rest of data sets
      while i < max_devices do
        datasets[i] << "<set value='' />"
        i += 1
      end  
    end

    xml_dataset = ""
    datasets.each do |set| 
      if set.size == member.locations.count then
        xml_dataset += "<dataset seriesName=''>"
        xml_dataset += set.join('')
        xml_dataset += "</dataset>"
      end  
    end
    
    # ****************   END of crappy XML dataaset conversion  *************************
    
    data += "#{categories} #{xml_dataset} #{get_trend_zones(date_filter)}</chart>"
    data
  end
  
  def all_locations_chart_xml_one_device(date_filter)
    #data = "&dataXML=<chart caption='Average dE By Device for all locations'  xAxisName='Device' yAxisName='Average dE' numberPrefix='' rotateValues='1' placeValuesInside='1'>"
    data = "&dataXML=<chart  numberPrefix=''  labelDisplay='Rotate' slantLabels='1' showValues='0' >"
    categories = "<categories><category name='#{date_filter.device.location.short_name}'/></categories>"
    link = url_for(:controller => "devices", :action => "device_trend", :device_id => date_filter.device.id)
    # determine which query to use to sub set results
    xml_dataset = "<dataset seriesName=''>
                    <set value='#{date_filter.device.ave_metric(date_filter)}' link='#{link}' toolText='#{date_filter.device.name}' />
                  </dataset>"
    data += "#{categories} #{xml_dataset} #{get_trend_zones(date_filter)}</chart>"
    data
  end
    
end