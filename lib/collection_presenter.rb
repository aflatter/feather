
class CollectionPresenter
  
  include Extlib::Hook
  extend  Forwardable

  def initialize(collection, controller)
    @collection = collection
    #(class << self; self; end).class_eval do
    #  def_delegators :'@collection', *collection.public_methods(false)
    #end
    @controller = controller
    #[controller, Merb::RenderMixin].each do |obj|
    #  (class << self; self; end).class_eval do
    #    def_delegators :'@controller', *(obj.is_a?(Module) ? obj.instance_methods(false) : obj.public_methods(false))
    #  end
    #end
  end
  
  def method_missing(method, *args)
    return @controller.send method, *args if @controller.respond_to?(method)
    super(method, *args)
  end

  def render_all
    last_index = @collection.size - 1 
    output = ""
    @collection.each_with_index do |element, index|
      case index
      when 0
        output << render_first(element)
      when last_index
        output << render_last(element)
      else
        output << render_one
      end
      output << render_between
    end
    output
  end
  
  def render_first(element)
    render_one(element)
  end

  def render_one(element)
    partial(element.class.to_s.underscore, :with => element)
  end
  
  def render_last(element)
    render_one(element)
  end
  
  def render_between
    partial :seperator
  end
  
  register_instance_hooks :render_first, :render_one, :render_last, :render_between

end