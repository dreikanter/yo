module Yo
  class ClassResolver
    attr_reader :scope, :class_name

    def initialize(scope:, class_name:)
      @scope = scope
      @class_name = class_name
    end

    def resolve
      Kernel.const_get("#{scope}::#{classy_name}")
    end

    private

    def classy_name
      class_name.gsub(/(?:\b|_)([a-z])/) { $1.capitalize }
    end
  end
end
