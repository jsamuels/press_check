class SheetsController < ApplicationController
  before_filter 	:authorize
  before_filter :sheets_init

  def index
  end



  def member_de_distribution
  	@accordian_active = 2
    @yAxisMaxValue = ""
  	@chart_width = "780"
  	@chart_height = "550"
  	@myAction = 'member_de_distribution'
  	trendlines = false
  	make_chart

  	sheets = Sheet.find_member_distribution(@date_filter) #session[:member_id]
  	# Set Variables for fusion_charts_xml
  	@chart_swf ="Bar2D.swf"
  	@caption = @member.name
  	@subcaption = "Distribution"
  	@xAxisName = "dE"
  	@yAxisName = "Number of Proofs"
  	@numberPrefix= ""
  	#Get the XML data
  	@xml_data = fusion_charts_xml(proofs, trendlines)
  	render( :action => "index" )
  end
  
  def member_patches_average_de
  	@accordian_active = 2
    @yAxisMaxValue = "2.75"
  	@chart_width = "780"
  	@chart_height = "550"
  	@myAction = 'member_patches_average_de'
  	trendlines = true
  	make_chart

  	sheets = Sheet.find_member_patches(@date_filter)
  	# Set Variables for fusion_charts_xml
  	@chart_swf ="Bar2D.swf"
  	@caption = @member.name
  	@subcaption = "Average By Patch"
  	@xAxisName = "Patch #"
  	@yAxisName = "Average"
  	@numberPrefix= ""
  	#Get the XML data
  	@xml_data = fusion_charts_xml(proofs, trendlines)
  	render( :action => "index" )
  end

  def member_device_average_de
  	@accordian_active = 2
    @yAxisMaxValue = ""
  	@chart_width = "780"
  	@chart_height = "550"
  	@myAction = 'member_device_average_de'
  	trendlines = true
  	make_chart

  	sheets = Device.member_device_average_de(@date_filter)
  	# Set Variables for fusion_charts_xml
  	@chart_swf ="Bar2D.swf"
  	@caption = @member.name
  	@subcaption = "Average dE by Device"
  	@xAxisName = ""
  	@yAxisName = "Average dE"
  	@numberPrefix= ""
  	#Get the XML data
  	@xml_data = fusion_charts_xml(proofs, trendlines)
  	render( :action => "index" )   
  end
  
  def member_device_sheet_count
  	@accordian_active = 2
    @yAxisMaxValue = ""
  	@chart_width = "780"
  	@chart_height = "550"
  	@myAction = 'member_device_proof_count'
  	trendlines = false
  	make_chart

  	sheets = Device.find_member_device_sheet_count(@date_filter)
  	# Set Variables for fusion_charts_xml
  	@chart_swf ="Bar2D.swf"
  	@caption = @member.name
  	@subcaption = "Proofs by Device"
  	@xAxisName = ""
  	#@yAxisName = "Total:  " + Device.find_count_member_proofs(@date_filter).first.proof_count
  	@numberPrefix= ""
  	#Get the XML data
  	@xml_data = fusion_charts_xml(proofs, trendlines)
  	render( :action => "index" )   
  end
private
  def sheets_init
    @myController = "proofs"
  end
end
