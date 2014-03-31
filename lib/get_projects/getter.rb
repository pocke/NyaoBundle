require 'pathname'
require_relative 'base'

module GetProjects
  module Getter
    include GetProjects::Base
    Dirs = [Pathname.new(File::expand_path('../getters',  __FILE__))]

    class << self
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
end
