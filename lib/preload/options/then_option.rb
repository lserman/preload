module Preload
  class ThenOption < Option

    def call
      controller.send callback, resource
    end

    private

      def callback
        value
      end

  end
end