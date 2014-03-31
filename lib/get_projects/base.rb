module GetProjects::Base
  def self.included(klass)
    klass.class_eval do
      const_set(:All, Hash.new)

      class << klass
        def create(name, &body)
          raise ArgumentError unless name.is_a?(Symbol)
          raise ArgumentError unless body.is_a?(Proc)
          raise ArgumentError unless body.parameters.size == 2
          self::All[name] = body
        end

        include Enumerable
        def each(*args)
          self::All.each(*args)
        end

        def [](key)
          self::All[key]
        end
      end
    end
  end
end
