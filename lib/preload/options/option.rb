module Preload
  class Option

    attr_accessor :value, :controller

    def initialize(value, controller)
      @value = value
      @controller = controller
    end

  end
end