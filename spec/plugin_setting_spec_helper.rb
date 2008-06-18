module PluginSettingSpecHelper
  class Plugin
    attr_accessor :id
    def initialize(*args)
      @id = 1
    end
  end
end