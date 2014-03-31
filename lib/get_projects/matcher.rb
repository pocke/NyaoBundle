require 'pathname'

# GetProjects::Matcher::create(:name){|project, opt|}
# 上のようにして matcher を定義する。
# Matcher は、xxx_yyy.rb といった名前で GetProjects::Matcher::Dir に定義する。
# xxx に数値、yyy に Matcher の名前を指定する。
# xxx の値が小さいほど優先して Matcher が使用される。
module GetProjects::Matcher
  # Matcher のリスト
  All = Hash.new

  Dirs = [Pathname.new(File::expand_path('../matchers',  __FILE__))]

  class << self
    # matcher を定義する。
    # マッチしなければ nil を、マッチすれば getter に必要な URL などを返す。
    # また、マッチした場合は opt を適当に編集する。
    def create(matcher_name, &body)
      raise ArgumentError unless matcher_name.is_a?(Symbol)
      raise ArgumentError unless body.is_a?(Proc)
      raise ArgumentError unless body.parameters.size == 2
      All[matcher_name] = body
    end

    include Enumerable
    def each(*args)
      All.each(*args)
    end

    def [](key)
      All[key]
    end

    def add_matchers
      files = []
      Dirs.each do |dir|
        files.concat(dir.children(false).map{|x|dir.join(x)})
      end
      files.sort_by{|x|x.basename.to_s.to_i}.each do |file|
        require_relative file
      end
    end
  end

  self.add_matchers
end
