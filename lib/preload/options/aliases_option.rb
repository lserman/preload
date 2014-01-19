module Preload
  class AliasesOption < Option

    def call(resource)
      aliases.each do |_alias|
        define_alias(_alias, resource)
        make_helper_method(_alias)
      end
    end

    private

      def define_alias(_alias, resource)
        controller.class.send :define_method, _alias do
          resource
        end
      end

      def make_helper_method(_alias)
        controller.class.send :helper_method, _alias
      end

      def aliases
        value
      end

  end
end