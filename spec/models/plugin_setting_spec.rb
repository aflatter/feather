require File.join( File.dirname(__FILE__), "..", "spec_helper" )
require File.join( File.dirname(__FILE__), "..", "plugin_setting_spec_helper" )

describe PluginSetting do
  before :all do
    PluginSetting.new({:plugin_id => 1, :handle => 'foo', :value => 'bar'}).save
    @plugin_stub = PluginSettingSpecHelper::Plugin.new
  end

  it "should find_by_handle_and_plugin" do
    'bar' == PluginSetting.find_by_handle_and_plugin('foo', @plugin_stub).value
  end
  
  describe "#read" do
    it "should directly return a PluginSetting's value"
    it "should find out the plugin's id via get_caller"
  end
  
  describe "#write" do
    it "should directly write a PluginSetting's value"
    it "should find out the plugin's id via get_caller"
    it "should create a new row with that if the handle does not yet exist"
    it "should update the row if the handle already exists"
  end
end