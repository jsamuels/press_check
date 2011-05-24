class DevicesController < ApplicationController  
  before_filter 	:authorize

  def index
    @accordian_active = 0
    @list_devices = @devices
  end
  
  def peek  
    fail cookies.inspect
  end  
  
  def location
    if params[:location]
      @location = Location.find(params[:location] )
      @list_devices = @location.devices
    else  
      @list_devices = Device.find(:all)
    end  
    @accordian_active = 0
    render( :action => "index" )
  end
  
  def chart # show all locations or one
    @date_filter.cur_action = 'chart'
    @date_filter.cur_controller = 'devices'    
    @accordian_active = 1
    @date_filter = find_date_filter 
    if params[:mertic]
      # nav link - reset filter
      @date_filter.metric = params[:mertic]   
      @date_filter.clear!
    else
      # update filter
      @date_filter.metric = @date_filter.metric || 'de'  
    end  
    if @date_filter.location == nil
      @date_filter.chart_group = "device_all_locations"
      @date_filter.chart_type = 'MSColumn3D.swf'
    else
      @date_filter.sheet = nil
      @date_filter.chart_group = "device_by_location"
      @date_filter.chart_type = 'Column3D.swf'
    end
  end
  
  def device_trend
    @accordian_active = 1
    device_id = params[:device_id] || @date_filter.device.id || nil
    if device_id
      @date_filter = find_date_filter
      @date_filter.sheet = nil
      @date_filter.device = Device.get_device_or_nil(device_id)
      @date_filter.cur_action = 'device_trend'
      @date_filter.cur_controller = 'devices'    
      @date_filter.chart_type = 'MSLine.swf'
      @date_filter.chart_group = "device_trend"
      render(:action => "chart")
    else
      redirect_to(:action => "chart")
    end
  end
  
  def device_by_patch
    @accordian_active = 1	
    device_id = params[:device_id] || @date_filter.device.id || nil
    if device_id
      @date_filter = find_date_filter
      @date_filter.sheet = nil
      @date_filter.device = Device.get_device_or_nil(device_id)
      @date_filter.cur_action = 'device_by_patch'
      @date_filter.cur_controller = 'devices'    
      @date_filter.chart_type = 'Bar2D.swf'
      @date_filter.chart_group = "device_by_patch"
      render(:action => "chart")
    else
      redirect_to(:action => "chart")
    end
    
  end
  
  def patch_by_sheet
    if params[:sheet_id]
      @date_filter = find_date_filter
      @date_filter.sheet = Sheet.find(params[:sheet_id])
      @date_filter.cur_action = 'patch_by_sheet'
      @date_filter.cur_controller = 'devices' 
      @date_filter.chart_group = "patch_by_sheet"   
      @accordian_active = 1
      @date_filter.chart_type = 'Bar2D.swf'
      render(:action => "chart")
    else
      redirect_to(:action => "chart")
    end
  end

end
