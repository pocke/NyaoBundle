require 'pathname'
require_relative 'base'

# GetProjects::Matcher::create(:name){|project, opt|}
# 上のようにして matcher を定義する。
# Matcher は、xxx_yyy.rb といった名前で GetProjects::Matcher::Dir に定義する。
# xxx に数値、yyy に Matcher の名前を指定する。
# xxx の値が小さいほど優先して Matcher が使用される。
module GetProjects
  module Matcher
    include GetProjects::Base
    Dirs = [Pathname.new(File::expand_path('../matchers',  __FILE__))]

    class << self
      def add_matchers
        files = []
        Dirs.each do |dir|
          files.concat(dir.children(false).select{|x|/\.rb$/ =~ x.to_s}.map{|x|dir.join(x)})
        end
        files.sort_by{|x|x.basename.to_s.to_i}.each do |file|
          require_relative file
        end
      end
    end
    self.add_matchers

    class DontMatch < StandardError; end
  end
end
