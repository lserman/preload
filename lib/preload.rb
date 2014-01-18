require 'preload/version'
require 'preload/inferences'
require 'preload/loader'

require 'active_support/all'

module Preload
  extend ActiveSupport::Concern

  def preload(*args, &block)
    options = args.extract_options!
    name = args.first || controller_name.singularize
    inferences = Inferences.new(name, self)
    resource = Loader.new(inferences, self).resolve(&block)
    instance_variable_set "@#{inferences.getter}", resource

    if callback = options[:then]
      send(callback, resource)
    end

  end

  module ClassMethods
    def preload(*args, &block)
      before_action { |ctrl| ctrl.preload *args, &block }
    end
  end

end
