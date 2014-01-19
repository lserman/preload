module Preload
  class Options

    def self.fetch(option, value, controller)
      opt =
        case option
        when :then
          ThenOption
        when :aliases
          AliasesOption
        else
          raise 'Invalid option'
        end

      opt.new(value, controller)
    end

  end
end