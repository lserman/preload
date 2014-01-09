require 'preload/version'
require 'preload/inferences'
require 'preload/loader'

require 'active_support/all'

module Preload
  extend ActiveSupport::Concern

  def preload(name, &block)
    name ||= controller_name.singularize
    inferences = Inferences.new(name, self)
    resource = Loader.new(inferences, self).resolve(&block)
    instance_variable_set "@#{inferences.getter}", resource
  end

  module ClassMethods

    def preload(name = nil, &block)
      send(:before_action) do |controller|
        controller.preload(name, &block)
      end
    end

  end
end
