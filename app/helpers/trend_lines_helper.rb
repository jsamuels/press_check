module TrendLinesHelper
  def get_trend_zones(date_filter)
  	#this sets the background of the chart green to yellow to red
  	my_return = "<trendLines>"
  	case date_filter.metric
  	when /^de$/    	
      my_return += "<line startValue='5' displayValue='USL AVE' lineThickness='2' color='FF0000' showOnTop='1' dashed='1' dashGap='5' isTrendZone='0' />
            	      <line startValue='8' displayValue='USL MAX' lineThickness='2' color='FF0000' showOnTop='1' dashed='1' dashGap='5' isTrendZone='0' />"
      my_return += "#{trend_zones_green}
                    #{trend_zones_orange}
                		#{trend_zones_red}"      	      
    else
    	tolerance = Tolerance.find(date_filter.tolerance_id) # do I need this????    
      patch_tolerance = PatchTolerance.find_tolerance(date_filter)
      patch_standard = PatchStandard.find_standard(date_filter)

      patch_standard = (patch_standard * 100.0).round
      patch_tolerance = (patch_tolerance * 100.0).round
     
      
      upper_spec_limit = patch_standard + patch_tolerance
      lower_spec_limit = patch_standard - patch_tolerance
      
      ps = patch_standard / 100.0
      usl = upper_spec_limit / 100.0
      lsl = lower_spec_limit / 100.0
      
      my_return += "<line startValue='#{usl.to_s}' displayValue='USL' lineThickness='2' color='FF0000' showOnTop='1' dashed='1' dashGap='5' isTrendZone='0' />
                    <line startValue='#{ps.to_s}' displayValue=' ' lineThickness='2' color='000000' showOnTop='1' dashed='1' dashGap='5' isTrendZone='0' />
            	      <line startValue='#{lsl.to_s}' displayValue='LSL' lineThickness='2' color='FF0000' showOnTop='1' dashed='1' dashGap='5' isTrendZone='0' />"
      my_return += "#{trend_zones_green2(lower_spec_limit, upper_spec_limit)}
                    #{trend_zones_orange2(lower_spec_limit, upper_spec_limit, patch_tolerance)}
                    #{trend_zones_red2(lower_spec_limit, upper_spec_limit, patch_tolerance)}"
    end

		 my_return += "</trendLines>"			
  end

private  
  # WHAT CHANGES ? I hope to find a way to boil this down to more DRY code
  # range
  # q
  # end value
  # alpha
  def trend_zones_green2(lower_spec_limit, upper_spec_limit)
    my_zones = ""
    (lower_spec_limit...upper_spec_limit).each do |x|
      q = (x/100.0)
      my_zones += "<line startValue='#{q}' displayValue=' ' endValue='#{q + 0.01}' alpha='40' color='008000' showOnTop='0' isTrendZone='1' />"
    end 
    return my_zones
  end
  
  def trend_zones_orange2(lower_spec_limit, upper_spec_limit, patch_tolerance)
    lsl = lower_spec_limit - (patch_tolerance/2)
    usl = upper_spec_limit + (patch_tolerance/2)
    # fail (lower_spec_limit).inspect
    my_zones = ""
    (lsl...lower_spec_limit).each do |x|
      q = (x/100.0)
      my_zones += "<line startValue='#{q}' displayValue=' ' endValue='#{q + 0.01}' alpha='40' color='FF9900' showOnTop='0' isTrendZone='1' />"
    end 
    (upper_spec_limit...usl).each do |x|
      q = (x/100.0)
      my_zones += "<line startValue='#{q}' displayValue=' ' endValue='#{q + 0.01}' alpha='40' color='FF9900' showOnTop='0' isTrendZone='1' />"
    end
    return my_zones
  end
  
  def trend_zones_red2(lower_spec_limit, upper_spec_limit, patch_tolerance)
    lsl = lower_spec_limit - (patch_tolerance/2)
    usl = upper_spec_limit + (patch_tolerance/2)
    my_zones = ""
    (0...lsl).each do |x|
      q = (x/100.0)
      
      my_zones += "<line startValue='#{q}' displayValue=' ' endValue='#{q + 0.01}' alpha='#{(2 + lsl-x)*5}' color='FF0000' showOnTop='0' isTrendZone='1' />"
    end 
    (usl...200).each do |x|
      q = (x/100.0)
      my_zones += "<line startValue='#{q}' displayValue=' ' endValue='#{q + 0.01}' alpha='#{(2 + x-usl)*5}' color='FF0000' showOnTop='0' isTrendZone='1' />"
    end
    return my_zones
  end
  
  
  def trend_zones_green
    my_zones = ""
    (0..4).each do |x|
      my_zones += "<line startValue='#{x}' displayValue=' ' endValue='#{x+1}' alpha='#{80-(x*10)}' color='008000' showOnTop='0' isTrendZone='1' />"
    end 
    return my_zones
  end
  def trend_zones_orange
    my_zones = ""
    (5..7).each do |x|
      my_zones += "<line startValue='#{x}' displayValue=' ' endValue='#{x+1}' alpha='#{(20+(x-3)*10)}' color='FF9900' showOnTop='0' isTrendZone='1' />"
    end
    return my_zones
  end
  def trend_zones_red
    my_zones = ""
    (8..100).each do |x|
      my_zones += "<line startValue='#{x}' displayValue=' ' endValue='#{x+1}' alpha='#{x*2}' color='FF0000' showOnTop='0' isTrendZone='1' />"
    end  
    return my_zones
  end
end