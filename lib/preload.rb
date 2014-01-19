require 'preload/version'
require 'preload/inferences'
require 'preload/loader'

require 'preload/options'
require 'preload/options/option'
require 'preload/options/then_option'
require 'preload/options/aliases_option'

require 'active_support/all'

module Preload
  extend ActiveSupport::Concern

  included do
    attr_accessor :inferences
    helper_method :model
  end

  def preload(*args, &block)
    options = args.extract_options!
    name    = args.first || controller_name.singularize

    self.inferences = Inferences.new(name, params)
    self._resource  = Loader.new(inferences, self).resolve(&block)

    options.each do |k, v|
      Options.fetch(k, v, self).(_resource)
    end
  end

  def model
    @model ||= inferences.model
  end

  def _resource=(resource)
    instance_variable_set "@#{inferences.getter}", resource
  end

  def _resource
    @resource ||= instance_variable_get "@#{inferences.getter}"
  end

  module ClassMethods
    def preload(*args, &block)
      before_action { |controller| controller.preload *args, &block }
    end
  end

end
