# TODO: DRY
module GetProjects::Getter
  All = Hash.new

  Dirs = [Pathname.new(File::expand_path('../getters',  __FILE__))]

  class << self
    def create(getter_name, &body)
      raise ArgumentError unless getter_name.is_a?(Symbol)
      raise ArgumentError unless body.is_a?(Proc)
      raise ArgumentError unless body.parameters.size == 2
      All[getter_name] = body
    end

    include Enumerable
    def each(*args)
      All.each(*args)
    end

    def [](key)
      All[key]
    end

    def add_getters
      files = []
      Dirs.each do |dir|
        files.concat(dir.children(false).map{|x|dir.join(x)})
      end
      files.sort_by{|x|x.basename.to_s.to_i}.each do |file|
        require_relative file
      end
    end
  end
  self.add_getters
end
