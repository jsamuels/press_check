require 'test_helper'

class ChartHelperTest < ActionView::TestCase
  test "chart width" do
    assert_equal 800, chart_width
  end
  test "chart height" do
    assert_equal 550, chart_height
  end
  test "chart_swf" do
    assert_equal 'my_chart', chart_swf('my_chart')
  end
  test "xml_data" do
    expected = %Q{&dataXML=<chart caption='Average dE ' subcaption='By Device' xAxisName='Device' yAxisName='Average dE' numberPrefix=''><set label='DAL-954-6' color='3300FF' value='0.04' toolText='DAL-954-6'  link='http://localhost:3000/devices/sheet_de_by_device?device_id=318' /><set label='DAL-C761-1' color='3300FF' value='' toolText='DAL-C761-1'  link='http://localhost:3000/devices/sheet_de_by_device?device_id=319' /><set label='DAL-C762-2' color='3300FF' value='0.27' toolText='DAL-C762-2'  link='http://localhost:3000/devices/sheet_de_by_device?device_id=320' /><set label='DAL-C763-4' color='3300FF' value='' toolText='DAL-C763-4'  link='http://localhost:3000/devices/sheet_de_by_device?device_id=321' /></chart>}
    assert_equal expected, xml_data
  end
  
end