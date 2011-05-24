class Reading < ActiveRecord::Base
  belongs_to :sheet
  belongs_to :device
  
  attr_internal :metric_value # this is to sore the value of the current metric, i.e. density
    
  def metric(metric)
    # use database to get aggreget values
    "%.02f" % case(metric)
              when 'de'
                self.de
              when 'density' 
                self.density
              when 'dot_gain' 
                self.dot_gain
              when 'print_contrast' 
                self.print_contrast
              when 'g7' 
                self.g7                                
              else
                0.0
              end            
  end
  
  def sort_key
    patch.split(/-/).flatten.compact.uniq.size.to_s + "-#{patch}"
  end
  
  
  def hex_color
    # from r g b in MySQL this is CONCAT('#', HEX(r), HEX(g), HEX(b)) as my_color
    # ruby wll be something like r.to_s(16) + g.to_s(16) + b.to_s(16)
    
    case self.patch
    when /000-000-000-000/
      # Paper
      hex_color = 'FFFFFF'
    when /000-000-000-[0-9]{3}/
      "Black #{self.black.to_i}"
      hex_color = '000000'
    when /[0-9]{3}-000-000-000/
      "Cyan #{self.cyan.to_i}"
       hex_color = '66CCFF'
    when /000-[0-9]{3}-000-000/
      "Magenta #{self.magenta.to_i}"
       hex_color = 'FF0066'
    when /000-000-[0-9]{3}-000/
      "Yellow #{self.yellow.to_i}"
       hex_color = 'FFFF00'
    when /075-066-066-000/
       hex_color = '333333'
    when /050-040-040-000/
       hex_color = '999999'
    when /025-019-019-000/
       hex_color = 'CCCCCC'
    else
      hex_color = '000000'
    end
  end
  
  def cyan
     /^([0-9]{3})-([0-9]{3})-([0-9]{3})-([0-9]{3})/.match(self.patch)
    return $1
  end
  def magenta
     /^([0-9]{3})-([0-9]{3})-([0-9]{3})-([0-9]{3})/.match(self.patch)
    return $2
  end
  def yellow
     /^([0-9]{3})-([0-9]{3})-([0-9]{3})-([0-9]{3})/.match(self.patch)
    return $3
  end    
  def black
     /^([0-9]{3})-([0-9]{3})-([0-9]{3})-([0-9]{3})/.match(self.patch)
    return $4
  end 
  
  def name
    case self.patch
    when /000-000-000-000/
      'Paper'
    when /000-000-000-[0-9]{3}/
      "Black #{self.black.to_i}"
    when /[0-9]{3}-000-000-000/
      "Cyan #{self.cyan.to_i}"
    when /000-[0-9]{3}-000-000/
      "Magenta #{self.magenta.to_i}"
    when /000-000-[0-9]{3}-000/
      "Yellow #{self.yellow.to_i}"
    when /075-066-066-000/
      "Grey 75"
    when /050-040-040-000/
      "Grey 50"
    when /025-019-019-000/
      "Grey 25"
    when ""
      "All"  
    else
      self.patch
    end   
  end
  
  def patch?(metric)
    case metric
    when /dot_gain/
       dot_gain?
    when /print_contrast/
      print_contrast?
    when /g7/
      g7?
    when /^de$/ # use ^ and $ to prevent match on density, although they return the same values, it is easier to update if they are broken out.
      true
    when /density/
      true
    else
      #fail metric.inspect
      false
    end      
  end
  
private  
  def dot_gain?
    # Only want CMYK 25, 50 & 75
    case self.name
    when /(Black|Cyan|Magenta|Yellow).+(25|50|75)/
      true
    else
      false
    end
  end
  
  def print_contrast?
    # Only want CMYK 50 & 75
    case self.name
    when /(Black|Cyan|Magenta|Yellow).+(50|75)/
      true
    else
      false
    end
  end
  
  def g7?
    # Only want Paper, Black or Grey 50 & 75
    case self.name
    when /(Black|Grey).+(25|50|75)/
      true
    when /Paper/
      true  
    else
      false
    end
  end
  
end
