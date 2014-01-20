module Preload
  class Option

    attr_accessor :value, :controller

    def initialize(value, controller)
      @value = value
      @controller = controller
    end

    protected

      def resource
        controller._resource
      end

  end
end